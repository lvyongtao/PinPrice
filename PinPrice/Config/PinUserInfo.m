//
//  PinUserInfo.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/15.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "PinUserInfo.h"

@implementation PinUserInfo
//获取用户登录类型
+ (NSString *)getloginType{
    NSString *loginType = [LVUserDefault objectForKey:@"loginType"];
    if (loginType.length == 0) {return @"";}else{return loginType;}
}
//获取用户的昵称
+ (NSString *)getnickName{
    NSString *nickName = [LVUserDefault objectForKey:@"nickName"];
    if (nickName.length == 0) {return @"";}else{return nickName;}
}
//获取用户的头像地址
+ (NSString *)getuserHeadImage{
    NSString *userHeadImage = [LVUserDefault objectForKey:@"userHeadImage"];
    if (userHeadImage.length == 0) {return @"";}else{return userHeadImage;}
}
//获取用户的手机号
+ (NSString *)getphone{
    NSString *phone = [LVUserDefault objectForKey:@"phone"];
    if (phone.length == 0) {return @"";}else{return phone;}
}
//获取用户的密码
+ (NSString *)getpassword{
    NSString *password = [LVUserDefault objectForKey:@"password"];
    if (password.length == 0) {return @"";}else{return password;}
}

+(NSString *)getUserID{
    NSString *userid = [LVUserDefault objectForKey:@"userid"];
    if (userid.length == 0) {return @"";}else{return userid;}
}


+(void)setUserID:(NSString *)userID{
    [LVUserDefault setObject:userID forKey:@"userid"];
    [LVUserDefault synchronize];
}
+(void)setphone:(NSString *)phone{
    [LVUserDefault setObject:phone forKey:@"phone"];
    [LVUserDefault synchronize];
}
+(void)setpassword:(NSString *)password{
    [LVUserDefault setObject:password forKey:@"password"];
    [LVUserDefault synchronize];
}
+(void)deleteUserID{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"userid"];
    [defaults synchronize];
}
+(void)deletePhone{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"phone"];
    [defaults synchronize];
}
+(void)deletePassword{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"password"];
    [defaults synchronize];
}
@end
