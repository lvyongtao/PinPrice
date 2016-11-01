//
//  MD5_Encryption.m
//  LVFrameWork
//
//  Created by user on 16/3/17.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#import <CommonCrypto/CommonDigest.h>
#import "MD5_Encryption.h"

@implementation MD5_Encryption

+(NSString *)getMd5_32BitWithString:(NSString *)string
{
    
    const char *cStr = [string UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)string.length, digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    return result;
    
    
    
    
    
}
#pragma mark Md5 加密
+(NSString*)createMd5Sign:(NSDictionary *)dict
{
    NSMutableString *contentString  =[NSMutableString string];
    NSArray *keys = [dict allKeys];
    //按字母顺序排序
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    //拼接字符串
    for (NSString *categoryId in sortedArray) {
        
        NSString *categoryid=[NSString stringWithFormat:@"%@",categoryId];
        NSString *categoryStr=[NSString stringWithFormat:@"%@",[dict objectForKey:categoryid]];
        if ( categoryStr.length>0
            && ![categoryid isEqualToString:@"sign"]
            && ![categoryid isEqualToString:@"key"]
            )
        {
            [contentString appendFormat:@"%@=%@&", categoryId, [dict objectForKey:categoryId]];
        }
        
    }
    NSString *APPI_KEY=@"";
    //添加key字段
    [contentString appendFormat:@"key=%@", APPI_KEY];
    //得到MD5 sign签名
    NSString *md5Sign =[self md5:contentString];
    
    return md5Sign;
}

+(NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned int)strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02X", digest[i]];
    
    return output;
}

@end
