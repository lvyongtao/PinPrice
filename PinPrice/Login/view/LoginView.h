//
//  LoginView.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/15.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UsertextFiledClickDelegate <NSObject>
@required
- (void)usertextFiledClickTag:(NSInteger )textFiledTag Text:(NSString *)text;
@end

@protocol UserBtnClickDelegate <NSObject>
@required
- (void)userBtnClickTag:(NSInteger )tag;
@end
//115
@interface UserAccountView : UIView<UITextFieldDelegate>
@property (weak, nonatomic) id<UsertextFiledClickDelegate >delegate;
@property (weak, nonatomic) id<UserBtnClickDelegate > btnDelegate;

@property (strong, nonatomic) UITextField *textField;

@property (assign, nonatomic) BOOL isShowIcon;
@property (assign, nonatomic) BOOL isShowBtn;
@property (assign, nonatomic) BOOL isShowLable;
@property (assign, nonatomic) BOOL isShowTextFiled;
@property (copy, nonatomic) NSString *iconName;
@property (copy, nonatomic) NSString *placeholder;
@property (copy, nonatomic) NSString *text;
@end



@protocol UserLoginBtnClickDelegate <NSObject>
@required
- (void)loginBtnClick:(NSInteger )btntTag;
@end
@interface LoginView : UIView
@property (weak, nonatomic)id<UserLoginBtnClickDelegate >delegate;

@property (strong, nonatomic) UIButton *loginBtn;

@property (strong, nonatomic) UserAccountView *userView;
@property (strong, nonatomic) UserAccountView *passordView;
@end
