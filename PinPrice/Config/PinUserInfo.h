//
//  PinUserInfo.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/15.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PinUserInfo : NSObject

@property (copy, nonatomic) NSString *loginType;
@property (copy, nonatomic) NSString *nickName;
@property (copy, nonatomic) NSString *userHeadImage;
@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *password;

//获取用户登录类型
+ (NSString *)getloginType;
//获取用户的昵称
+ (NSString *)getnickName;
//获取用户的头像地址
+ (NSString *)getuserHeadImage;
//获取用户的手机号
+ (NSString *)getphone;
//获取用户的密码
+ (NSString *)getpassword;
//获取用户的id
+ (NSString *)getUserID;


/**
 *  @property (copy, nonatomic) NSString *phone;
 @property (copy, nonatomic) NSString *password;
 */

+(void)setUserID:(NSString *)userID;
+(void)setphone:(NSString *)phone;
+(void)setpassword:(NSString *)password;
+ (void)deleteUserID;
+ (void)deletePhone;
+ (void)deletePassword;
@end
