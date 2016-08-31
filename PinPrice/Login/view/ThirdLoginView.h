//
//  ThirdLoginView.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/15.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  第三方登录：微博，QQ，微信
 */
typedef NS_ENUM(NSInteger,ThirdLoginType) {
    ThirdLoginTypeWeibo = 0,
    ThirdLoginTypeQQ,
    ThirdLoginTypeWeixin
};
/**
 *  登录的类型代理
 */
@protocol ThirdLoginBtnClickDelegate <NSObject>
@required
- (void)thirdLoginTypeClick:(ThirdLoginType )type;
@end
@interface ThirdLoginView : UIView
@property (weak, nonatomic)id<ThirdLoginBtnClickDelegate >delegate;
@end
