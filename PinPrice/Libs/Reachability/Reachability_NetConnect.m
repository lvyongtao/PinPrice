//
//  Reachability_NetConnect.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/27.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "Reachability_NetConnect.h"

@implementation Reachability_NetConnect
+ (BOOL)NetConnect{
    BOOL isExistNetWork = YES;
    //1.检测wifi的状态
    Reachability * wifi = [Reachability reachabilityForLocalWiFi];
    //2.检测手机是否能够上网(wifi/2G/3G)
    Reachability * connect = [Reachability reachabilityForInternetConnection];
    //3.判断网络状态
    if ([wifi currentReachabilityStatus] != NotReachable) {
        //wifi
        isExistNetWork = YES;
    }else if ([connect currentReachabilityStatus] != NotReachable){
        //手机自带的网路
        isExistNetWork = YES;
    }else{
        isExistNetWork = NO;
    }
    return isExistNetWork;
}
@end
