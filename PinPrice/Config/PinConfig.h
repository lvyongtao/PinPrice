//
//  PinConfig.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/15.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#ifndef PinConfig_h
#define PinConfig_h

#define APPNAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define LVNotificationCenter [NSNotificationCenter defaultCenter]
#define LVUserDefault [NSUserDefaults standardUserDefaults]


#define ShareSDKAPP_KEY @"169c8a47b74b9"
//第三方服务的key
#define UmengAppKey @"550a9500fd98c55ab1000f57"//友盟分享appKey
#define ShareQQAppID @"1104418201"//腾讯appID
#define ShareQQAppKey @"ypxK0NC3YD3ZbagT"//腾讯appKey
#define WetChatAppId @"wx7b1afe37e90787fc"//微信appID
#define WetChatAppSecret @"2bd06ca54d0aca139be9f6e89c04355f"//微信appSecret
#define SMSMobAppKey @"683feb4e2540"//MobAppKey
#define SMSMobAppSecret @"8ad765a4dae8d2d2948ff72944b0d8a0"
#define SMSMobAppKeyTest @"114ed22f249fe"//MobAppKey--测试使用
#define SMSMobAppSecretTest @"59c4b7aa8864140c2512acfaeb81e063"



#define PinBaseBtnGreenColor RGBCOLOR(0,160,234)

#endif /* PinConfig_h */
