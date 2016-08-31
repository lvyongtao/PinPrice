//
//  LoginView.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/15.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  TextFiled的代理
 */
@protocol UsertextFiledClickDelegate <NSObject>
@required

- (void)usertextFiledClickTag:(NSInteger )textFiledTag Text:(NSString *)text;
@end
/**
 *  发送验证码的代理
 */
@protocol UserBtnClickDelegate <NSObject>
@required
- (void)userBtnClickTag:(NSInteger )tag;
@end
//
@interface UserAccountView : UIView<UITextFieldDelegate>
@property (weak, nonatomic) id<UsertextFiledClickDelegate >delegate;
@property (weak, nonatomic) id<UserBtnClickDelegate > btnDelegate;

@property (strong, nonatomic) UITextField *textField;
/**
 *  是否显示相应的视图
 */
@property (assign, nonatomic) BOOL isShowIcon;
@property (assign, nonatomic) BOOL isShowBtn;
@property (assign, nonatomic) BOOL isShowLable;
@property (assign, nonatomic) BOOL isShowTextFiled;
/**
 *  视图的text
 */
@property (copy, nonatomic) NSString *iconName;
@property (copy, nonatomic) NSString *placeholder;
@property (copy, nonatomic) NSString *text;
@end


/**
 *  用户登录的代理
 */
@protocol UserLoginBtnClickDelegate <NSObject>
@required
- (void)loginBtnClick:(NSInteger )btntTag;
@end
@interface LoginView : UIView
@property (weak, nonatomic)id<UserLoginBtnClickDelegate >delegate;

@property (strong, nonatomic) UIButton *loginBtn;
/**
 *  基本视图
 */
@property (strong, nonatomic) UserAccountView *userView;
@property (strong, nonatomic) UserAccountView *passordView;
@end
