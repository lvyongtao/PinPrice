//
//  NetManager.m
//  KisMart
//
//  Created by user on 15/11/4.
//  Copyright © 2015年 lvyongtao. All rights reserved.
//

#import "NetManager.h"
#import "AFNetworking.h"
#import <Security/Security.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <AVFoundation/AVAsset.h>
#import <AVFoundation/AVAssetExportSession.h>
#import <AVFoundation/AVMediaFormat.h>
@implementation NetManager

#pragma mark --GET
+ (void)Get:(NSString *)url parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{
    AFHTTPRequestOperationManager *manager = [self manager];
    NSString *urlStr = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [manager GET:urlStr parameters:parameters success:^(AFHTTPRequestOperation * operation, id receive) {
        if (success) {
            NSString *jsonString = [[NSString alloc] initWithData:(NSData *)receive encoding:NSUTF8StringEncoding];
            NSLog(@"%@",jsonString);
            NSData *data = [[NSData alloc]initWithData:[operation.responseString dataUsingEncoding:NSUTF8StringEncoding]];
            id dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            success(dic);

        }
//        success(receive);
        
    } failure:^(AFHTTPRequestOperation *operation,NSError *error){
       
        failure(error.description);
        
    }];
}
#pragma mark --POST
+ (void)Post:(NSString *)url parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{
    AFHTTPRequestOperationManager *manager = [self manager];
//    [self setHttpHeader:manager];
    NSString *urlStr =[url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation * operation, id receive) {
        
        success(receive);
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
       
        failure(error.description);
        
    }];
}
#pragma mark --AFN-setting
+(AFHTTPRequestOperationManager *)manager{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.securityPolicy.allowInvalidCertificates=YES;
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html", nil];
    
    return manager;
}
#pragma mark --上传一张图
+(void)afUploadImageWithUrlString:(NSString *)urlString parms:(NSDictionary *)dic  imageData:(NSData *)data imageKey:(NSString *)key success:(Success)success failure:(Failure)failure{

    AFHTTPRequestOperationManager *magager=[self manager];
//    [self setHttpHeader:magager];
  NSString *urlStr = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
   [magager POST:urlStr parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
       
       if(data!=nil)
       {
           [formData appendPartWithFileData:data name:key fileName:@"test.png" mimeType:@"image/png"];
       }
       
   } success:^(AFHTTPRequestOperation *operation, id receive) {
       
       success(receive);
       
   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
       failure(error.description);
   }];
    
}
#pragma mark --上传多张图
+(void)afUpMuchImageWithUrlString:(NSString *)urlString parms:(NSDictionary *)dict imagesArray:(NSArray *)imagesArray imageKey:(NSString *)key success:(Success)success failure:(Failure)failure
{
    AFHTTPRequestOperationManager *magager=[self manager];
  
    NSString *urlStr = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [magager POST:urlStr parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        for (int i=0; i<imagesArray.count; i++) {
            
            if (imagesArray[i]!=nil) {
                
                [formData appendPartWithFileData:(NSData *)imagesArray[i] name:key fileName:[NSString stringWithFormat:@"test%d.png",i] mimeType:@"image/png"];
            }
            
        }
        
    } success:^(AFHTTPRequestOperation *operation, id receive) {
        
        success(receive);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(error.debugDescription);
        
    }];
    
    
    
    
}
#pragma mark --上传音频和视频
+ (void)upLoadVideoWithOption:(NSDictionary *)para withInferface:(NSString *)requestURL videoPath:(NSURL *)videoURL uploadSuccess:(Success)success uoloadFailure:(Failure)failure progress:(void (^)(float))progress{
    
    //此处为对视频进行转码并且压缩为，最终输出为MP4的格式
    //输出后将文件保存到了/Library/Caches/文件夹内
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:videoURL options:nil];
    AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:avAsset presetName:AVAssetExportPresetMediumQuality];
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    NSString *mp4Path = [NSHomeDirectory() stringByAppendingFormat:@"/Library/Caches/output-%@.mp4", [formater stringFromDate:[NSDate date]]];
    exportSession.outputURL = [NSURL fileURLWithPath: mp4Path];
    exportSession.outputFileType = AVFileTypeMPEG4;
    [exportSession exportAsynchronouslyWithCompletionHandler:^{
        switch ([exportSession status]) {
            case AVAssetExportSessionStatusFailed:
            {
            //错误提示
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"错误"
                                                                message:[[exportSession error] localizedDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles: nil];
                [alert show];
                break;
            }
                
            case AVAssetExportSessionStatusCancelled:
            {
                UIAlertView* alert1 = [[UIAlertView alloc] initWithTitle:@"用户手动取消"
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles: nil];
                [alert1 show];
                break;
            }
            case AVAssetExportSessionStatusCompleted:
            {
                
                AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
                //text/plain
                manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
                AFHTTPRequestOperation *opera = [manager POST:requestURL parameters:para constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                    
                    NSData *videoData = [NSData dataWithContentsOfFile:mp4Path];
                    [formData appendPartWithFileData:videoData name:@"video000" fileName:@"video000.mp4" mimeType:@"video/mpeg4"];
                    
                } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    
//                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                    success(responseObject);
                    
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    
                    failure (error.description);
                }];
                
                [opera setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
                    CGFloat xx = totalBytesExpectedToWrite;
                    CGFloat yy = totalBytesWritten;
                    CGFloat pro = yy/xx;
                    progress(pro);
                }];
                [opera start];
                break;
            }
            default:
                break;
        }
    }];
}
#pragma mark --下载文件
+ (void)downloadFileWithOption:(NSDictionary *)paramDic withInferface:(NSString *)requestURL savedPath:(NSString *)savedPath downloadSuccess:(Success)success downloadFailure:(Failure)failure progress:(void (^)(float))progress{
    
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    NSMutableURLRequest *request =[serializer requestWithMethod:@"POST" URLString:requestURL parameters:paramDic error:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setOutputStream:[NSOutputStream outputStreamToFileAtPath:savedPath append:NO]];
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        float p = (float)totalBytesRead / totalBytesExpectedToRead;
        progress(p);
         NSLog(@"download percent：%f%%", (float)totalBytesRead / totalBytesExpectedToRead);
        //下载进度
        
    }];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id receive) {
        success(receive);
        NSLog(@"下载成功");
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        success(error.description);
        
        NSLog(@"下载失败");
        
    }];
    
    [operation start];
}
#pragma mark --压缩图片
+ (UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth
{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height / (width / targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if(CGSizeEqualToSize(imageSize, size) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if(widthFactor > heightFactor){
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(size);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil){
        NSLog(@"scale image fail");
    }
    
    UIGraphicsEndImageContext();
    return newImage;
}


@end
