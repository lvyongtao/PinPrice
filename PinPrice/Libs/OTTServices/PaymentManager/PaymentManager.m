//
//  PaymentManager.m
//  PinPrice
//
//  Created by lvyongtao on 16/9/2.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "PaymentManager.h"
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>

@interface PaymentManager ()<WXApiDelegate>
@end
@implementation PaymentManager
static PaymentManager *manager = nil;
+(instancetype)shareManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PaymentManager alloc] init];
    });
    return manager;
}
- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    @synchronized(self) {
        if (!manager) {
            manager = [super allocWithZone:zone];
            return manager;
        }
    }
    return nil;
}
- (id)copyWithZone:(NSZone *)zone{
    return self;
}

- (void)WeiXinPaymentManager{
    if ([WXApi isWXAppInstalled]) {
        if ([WXApi isWXAppSupportApi]) {
            
            //============================================================
            // V3&V4支付流程实现
            // 注意:参数配置请查看服务器端Demo
            // 更新时间：2015年11月20日
            //============================================================
            NSString *urlString   = @"http://wxpay.weixin.qq.com/pub_v2/app/app_pay.php?plat=ios";
            NSError *error;
            //加载一个NSURL对象
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
            //将请求的url数据放到NSData对象中
            NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            
            
            if (response != nil) {
                NSMutableDictionary *jsonDict = NULL;
                jsonDict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
                NSLog(@"--url:--%@",urlString);
                
                if (jsonDict != nil) {
                    NSMutableString *retcode = [jsonDict objectForKey:@"retcode"];
                    NSLog(@"获取到的数据%@",jsonDict);
                    if ([retcode intValue] == 0) {
                        NSMutableString *timeStamp = [jsonDict objectForKey:@"timestamp"];
                        PayReq *req = [PayReq new];
                        req.partnerId = [jsonDict objectForKey:@"partnerid"];
                        req.prepayId= [jsonDict objectForKey:@"prepayid"];
                        req.package = [jsonDict objectForKey:@"package"];
                        req.nonceStr= [jsonDict objectForKey:@"noncestr"];
                        req.timeStamp= [timeStamp intValue];
                        req.sign= [jsonDict objectForKey:@"sign"];
                        
                        if ([WXApi sendReq:req]) {
                            NSLog(@"成功  WeiXin");
                        }else{
                            NSLog(@"失败  WeiXin");
                        }
                        NSLog(@"安装微信");
                        NSLog(@"微信版本支持");
                        
                    }
                }
            }
            
        }else{
            //[WXApi isWXAppSupportApi]
            NSLog(@"微信版本不支持");
        }
    }else{
        //[WXApi isWXAppInstalled]
        NSLog(@"未安装微信");
        NSString *WeiXinUrl = [WXApi getWXAppInstallUrl];
        NSURL *url = [NSURL URLWithString:WeiXinUrl];
        NSLog(@"%@",WeiXinUrl);
        [[UIApplication sharedApplication] openURL:url];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            NSLog(@"可以打开URL");
        }else{
            NSLog(@"不能打开URL");
        }
        
        
    }
}
- (void)AlipayPaymentManager{
    NSString *appScheme=@"alipayDemo";
    
    NSString *orderString = @"http://wxpay.weixin.qq.com/pub_v2/app/app_pay.php?plat=ios";
    
    [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
        
        NSString *resultStatus=[NSString stringWithFormat:@"%@",resultDic[@"resultStatus"]];
        if ([resultStatus intValue]==9000) {
            NSLog(@"订单支付成功");
            
        }
        else
        {
            
            NSLog(@"订单支付失败%@",resultDic[@"resultStatus"]);
        }
        
        
        
    }];
}
#pragma mark - WXApiDelegate
//微信回调
- (void)onResp:(BaseResp *)resp{
    if ([resp isKindOfClass:[PayResp class]]) {
        NSString *strMsg = nil;
        
        NSString *strTitle =[NSString stringWithFormat:@"支付结果"];
        
        switch (resp.errCode) {
            case WXSuccess:
                strMsg = @"支付结果：成功！";
                NSLog(@"支付成功－PaySuccess，retcode = %d", resp.errCode);
                break;
                
            default:
                strMsg = [NSString stringWithFormat:@"支付结果：失败！retcode = %d, retstr = %@", resp.errCode,resp.errStr];
                NSLog(@"错误，retcode = %d, retstr = %@", resp.errCode,resp.errStr);
                break;
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
}
@end
