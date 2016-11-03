//
//  UIView+MBView.m
//  MB提示demo
//
//  Created by user on 16/2/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "UIView+MBView.h"
#import "MBProgressHUD.h"



@implementation UIView (MBView)


+ (void)MBAlertViewShowWith:(UIView *)superMBView{
    [MBProgressHUD showHUDAddedTo:superMBView animated:YES];
}

+ (void)MBAlertViewWithMsg:(NSString *)message With:(UIView *)superMBView{
    //只能显示一行文字
    MBProgressHUD *mbHub = [MBProgressHUD showHUDAddedTo:superMBView animated:YES];
    mbHub.mode = MBProgressHUDModeText;
    mbHub.labelFont = [UIFont systemFontOfSize:14];
    mbHub.color = RGBCOLOR(10, 10, 10);
    mbHub.animationType = MBProgressHUDAnimationZoom;//MBProgressHUDAnimationZoom MBProgressHUDAnimationZoomIn MBProgressHUDAnimationFade
    mbHub.labelColor = [UIColor whiteColor];
    mbHub.labelText = message;
    [mbHub setMinSize:CGSizeZero];
    mbHub.margin = 10.f;
    mbHub.removeFromSuperViewOnHide = YES;
}


+ (void)MBAlertCustomStyleWithMsg:(NSString *)message With:(UIView *)superMBView{
        MBProgressHUD *mbHub = [MBProgressHUD showHUDAddedTo:superMBView animated:YES];
        mbHub.labelText = message;
        mbHub.square = YES;
        mbHub.mode = MBProgressHUDModeIndeterminate;
    //是否背景色置灰
        mbHub.dimBackground = NO;
    //MBProgressHUDModeDeterminateHorizontalBar //进度条
    //MBProgressHUDModeIndeterminate 菊花样式
    //MBProgressHUDModeDeterminate  圆形进度条
    //MBProgressHUDModeAnnularDeterminate  圆形进度条1
    //MBProgressHUDModeCustomView 自定义视图
    //MBProgressHUDModeText 文本样式
}
+ (void)MBAlertCustomViewWithMsg:(NSString *)message With:(UIView *)superMBView{
    MBProgressHUD *mbHub = [MBProgressHUD showHUDAddedTo:superMBView animated:YES];
    mbHub.labelText = message;
    mbHub.square = YES;
    mbHub.mode = MBProgressHUDModeCustomView;
    mbHub.color = [UIColor blackColor];
    mbHub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
    mbHub.animationType = MBProgressHUDAnimationZoom;
//    MBBarProgressView  *mbBar = [[MBBarProgressView alloc] init];
//    mbBar.progress = 0.8;
//    mbBar.lineColor = [UIColor grayColor];
//    mbBar.progressRemainingColor = [UIColor greenColor];
//    mbBar.progressRemainingColor = [UIColor redColor];
//    mbHub.customView = mbBar;
    [mbHub show:YES];
}


+ (void)MBHiddenWith:(UIView *)superMBView{
    [MBProgressHUD hideHUDForView:superMBView animated:YES];
}

+ (void)MBHiddenAllWith:(UIView *)superMBView{
    [MBProgressHUD hideAllHUDsForView:superMBView animated:YES];
}
@end
