//
//  NetManager.h
//  KisMart
//
//  Created by user on 15/11/4.
//  Copyright © 2015年 lvyongtao. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ Success)(id receive);
typedef void(^ Failure)(NSString *errorMsg);

typedef void(^DownloadFinishedBlock)(id responseObj);
typedef void (^DownloadFailedBlock)(NSString *errorMsg);

@interface NetManager : NSObject
/**
 *  get请求
 *
 *  @param url        请求地址
 *  @param parameters 请求参数
 *  @param success    成功回调block
 *  @param failure    失败回调block
 */
+ (void)Get:(NSString *)url parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;
/**
 *  post请求
 *
 *  @param url        请求地址
 *  @param parameters 请求参数
 *  @param success    成功回调block
 *  @param failure    失败回调block
 */
+ (void)Post:(NSString *)url parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 *  上传图片
 *
 *  @param url        请求地址
 *  @param parameters 中放除图片以外的其他参数
 *  data 图片转换的NSData
 *  key 为图片对应的key：pis
 *  @param success    成功回调block
 *  @param failure    失败回调block
 */
+(void)afUploadImageWithUrlString:(NSString *)urlString parms:(NSDictionary *)dic  imageData:(NSData *)data imageKey:(NSString *)key success:(Success)success failure:(Failure)failure;


/**
 *  上传多张图片
 *
 *  @param url        请求地址
 *  @param parameters 中放除图片以外的其他参数
 *  imagesArray 多张图片
 *  imageKey 为图片对应的key：pis
 *  @param success    成功回调block
 *  @param failure    成功回调block
 */
+(void)afUpMuchImageWithUrlString:(NSString *)urlString parms:(NSDictionary *)dict imagesArray:(NSArray *)imagesArray imageKey:(NSString *)key success:(Success)success failure:(Failure)failure;
/**
 *  视频音频上传
 *
 *  @param para       字典参数
 *  @param requestURL 请求地址
 *  @param videoURL   视频音频的地址
 *  @param success    成功回调block
 *  @param failure    失败回调block
 *  @param progress   进度提示
 */
+ (void)upLoadVideoWithOption:(NSDictionary *)para
                withInferface:(NSString *)requestURL
                    videoPath:(NSURL *)videoURL
                uploadSuccess:(Success)success
                uoloadFailure:(Failure)failure progress:(void (^)(float))progress;

/**
 *  文件下载
 *
 *  @param paramDic                       字典参数
 *  @param requestURL                     请求地址
 *  @param savedPath                      保存的路径
 *  @param success                        成功回调block
 *  @param failure                        失败回调block
*  @param progress                        进度提示
 */
+ (void)downloadFileWithOption:(NSDictionary *)paramDic
                 withInferface:(NSString*)requestURL
                     savedPath:(NSString*)savedPath
               downloadSuccess:(Success)success
               downloadFailure:(Failure)failure
                      progress:(void (^)(float progress))progress;
/**
 *   图片的压缩
 *
 *  @param sourceImage 图片
 *  @param defineWidth 宽度
 *  @return 压缩后的图片
 */
+ (UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

/**
 *  网络监听
 */
//+ (void)AFNetWorkReachabilityIsConnect;


@end
