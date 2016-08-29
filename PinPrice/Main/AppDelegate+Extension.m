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
//    NSArray *
}









-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
    return [TencentOAuth HandleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [TencentOAuth HandleOpenURL:url];
}
@end
