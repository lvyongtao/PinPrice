//
//  AppDelegate+Extension.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/8.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "AppDelegate.h"
#import <TencentOpenAPI/TencentApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>

@interface AppDelegate (Extension)

/**
 *  用户是否登录
 */
- (void)initLogin;
/**
 *  第三方登陆
 */
- (void)ThirdLogin;
@end
