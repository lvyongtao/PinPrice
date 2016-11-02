//
//  AppDelegate+Extension.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/8.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "AppDelegate+Extension.h"
#import "PinTabBarController.h"
#import "LoginViewController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>

#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

#import "WXApi.h"

#import "WeiboSDK.h"



@implementation AppDelegate (Extension)

- (void)initLogin{
    if ([PinUserInfo getUserID].length > 0) {
        PinTabBarController *pin = [[PinTabBarController alloc] init];
        self.window.rootViewController = pin;
    }else{
        LoginViewController *login = [[LoginViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:login];
        self.window.rootViewController = nav;
    }
    [self.window makeKeyAndVisible];
}

- (void)ThirdLogin{
    
    NSArray *activeApps = @[@"SSDKPlatformTypeSinaWeibo",@"SSDKPlatformTypeQQ",@"SSDKPlatformTypeWechat"];
    [ShareSDK registerApp:ShareSDKAPP_KEY activePlatforms:activeApps onImport:^(SSDKPlatformType platformType) {
        switch (platformType) {
            case SSDKPlatformTypeWechat:
                [ShareSDKConnector connectWeChat:[WXApi class]];
                break;
            case SSDKPlatformTypeSinaWeibo:
                [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                break;
            case SSDKPlatformTypeQQ:
                [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                break;
                
            default:
                break;
        }
    } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
        switch (platformType) {
            case SSDKPlatformTypeSinaWeibo:
                //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                [appInfo SSDKSetupSinaWeiboByAppKey:@"568898243"
                                          appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                                        redirectUri:@"http://www.sharesdk.cn"
                                           authType:SSDKAuthTypeBoth];
                break;
            case SSDKPlatformTypeWechat:
                [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                      appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                break;
            case SSDKPlatformTypeQQ:
                [appInfo SSDKSetupQQByAppId:@"100371282"
                                     appKey:@"aed9b0303e3ed1e27bae87c33761161d"
                                   authType:SSDKAuthTypeBoth];
                break;
                
            default:
                break;
        }
    }];
    
}

- (void)initPaymentManager{
    [WXApi registerApp:@"wxde12ad1a56b4f6ae"];
}

- (void)addObserverForNetwork{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkChange:) name:kReachabilityChangedNotification object:nil];
    //此处可以切换公司的IP
    Reachability * reacha = [Reachability reachabilityWithHostName:@"http://www.baidu.com"];
    [reacha startNotifier];
}
- (void)networkChange:(NSNotification *)noti
{
    
    NSString *tips;
    Reachability *curReach = [noti object];
    NetworkStatus status = [curReach currentReachabilityStatus];
    switch (status) {
        case ReachableViaWiFi:
          tips = @"切换到了WI-FI网络";
            break;
        case ReachableViaWWAN:
            tips = @"切换到了4G网络";
            break;
        case NotReachable:
            tips = @"当前无网络, 请检查您的网络状态";
            break;
        default:
            break;
    }
    
    NSLog(@"tips = %@",tips);
    NSSLog(@"reach tips = %@",tips);
    if (tips.length) {
        [[[UIAlertView alloc] initWithTitle:@"PinPrice" message:tips delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
    }
}




-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
    return [TencentOAuth HandleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [TencentOAuth HandleOpenURL:url];
}
@end
