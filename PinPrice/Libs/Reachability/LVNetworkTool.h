//
//  LVNetworkTool.h
//  PinPrice
//
//  Created by lvyongtao on 16/11/1.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, NetworkStates) {
    NetworkStatesNone, // 没有网络
    NetworkStates2G, // 2G
    NetworkStates3G, // 3G
    NetworkStates4G, // 4G
    NetworkStatesWIFI // WIFI
};
@interface LVNetworkTool : NSObject

// 判断网络类型
+ (NetworkStates)getNetworkStates;
@end
