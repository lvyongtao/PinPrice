//
//  MD5_Encryption.h
//  LVFrameWork
//
//  Created by user on 16/3/17.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MD5_Encryption : NSObject
+(NSString *)getMd5_32BitWithString:(NSString *)string;


/// 进行MD5加密
+(NSString*)createMd5Sign:(NSDictionary*)dict;
@end
