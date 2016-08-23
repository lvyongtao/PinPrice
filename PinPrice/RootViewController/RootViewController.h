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

///创建导航栏标题
-(void)addTitleViewWithTitle:(NSString *)title;
/// 导航栏设置左侧按钮
-(void)addLeftBtnWithTitle:(NSString *)title withImage:(UIImage *)image WithTitleColor:(UIColor *)color withTarget:(id)target withMethod:(SEL)select;
///导航栏设置右侧按钮
-(UIButton *)addRightBtnWithTitle:(NSString *)title withImage:(UIImage *)image withTitleColor:(UIColor *)color withTarget:(id)target withMethod:(SEL)select;

-(void)addRightBtnsWithTitle1:(NSString *)title1 WithTitle2:(NSString *)title2 withImage:(UIImage *)image withTitleColor:(UIColor *)color withTarget:(id)target withMethod:(SEL)select;
@end
