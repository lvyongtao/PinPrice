//
//  ThirdLoginView.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/15.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ThirdLoginType){
    ThirdLoginTypeWeibo = 0,
    ThirdLoginTypeQQ,
    ThirdLoginTypeWeixin
};
@protocol ThirdLoginBtnClickDelegate <NSObject>
@required
- (void)thirdLoginTypeClick:(ThirdLoginType )type;
@end
@interface ThirdLoginView : UIView
@property (weak, nonatomic)id<ThirdLoginBtnClickDelegate >delegate;
@end
