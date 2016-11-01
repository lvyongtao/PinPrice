//
//  RootViewController.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/8.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

/**
 *  是否显示tabbar
 */
@property (nonatomic,assign)BOOL isShowTabbar;
/**
 *  加载视图
 */
- (void)showLoadingAnimation;
/**
 *  停止加载
 */
- (void)stopLoadingAnimation;
/**
 *   提示信息
 */
- (void)showMessageTitle:(NSString *)title;
/**
 <#Description#>
 
 - returns: <#return value description#>
 */
+(void)showAlertWithTitle:(NSString *)title message:(NSString *)message;
/**
 *  自定义NavgationBar
 */
- (void)initNavgationBar;
/**
 *  清除用户的信息
 */
- (void)clearUserInfo;
/**
 *  清除缓存信息
 */
- (void)cleanMemory;
///创建导航栏标题
-(void)addTitleViewWithTitle:(NSString *)title;
/// 导航栏设置左侧按钮
-(void)addLeftBtnWithTitle:(NSString *)title withImage:(UIImage *)image WithTitleColor:(UIColor *)color withTarget:(id)target withMethod:(SEL)select;
///导航栏设置右侧按钮
-(UIButton *)addRightBtnWithTitle:(NSString *)title withImage:(UIImage *)image withTitleColor:(UIColor *)color withTarget:(id)target withMethod:(SEL)select;

-(void)addRightBtnswithImage1:(UIImage *)image1 withImage2:(UIImage *)image2 withTitleColor:(UIColor *)color withTarget:(id)target withMethod:(SEL)select;
@end
