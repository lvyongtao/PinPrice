//
//  NewAddressView.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define NEWVIEW_H 50
#import "NewAddressView.h"

@interface NewAddressView ()<UITextFieldDelegate,UITextViewDelegate>

@property (strong, nonatomic) UILabel *titleLable;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UITextView *textView;

@property (strong, nonatomic) UIView *singleLine;

@end


@implementation NewAddressView

- (UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.backgroundColor = [UIColor clearColor];//0.07
        _titleLable.textColor = [UIColor grayColor];
        _titleLable.textAlignment = NSTextAlignmentLeft;
        _titleLable.font = [UIFont systemFontOfSize:16];
        [self addSubview:_titleLable];
    }
    return _titleLable;
}
- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.backgroundColor = [UIColor clearColor];
        _textField.textAlignment = NSTextAlignmentLeft;
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.font = [UIFont systemFontOfSize:16];
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.tag = self.tag;
        _textField.delegate = self;
        [self addSubview:_textField];
    }
    return _textField;
}
- (UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.textAlignment = NSTextAlignmentLeft;
        _textView.returnKeyType = UIReturnKeyDone;
        _textView.font = [UIFont systemFontOfSize:16];
        _textView.tag =self.tag;
        _textView.delegate = self;
        [self addSubview:_textView];
    }
    return _textView;
}
- (UIView *)singleLine{
    if (!_singleLine) {
        _singleLine = [[UIView alloc] init];
        _singleLine.backgroundColor =[UIColor grayColor];
        [self addSubview:_singleLine];
    }
    return _singleLine;
}
#pragma mark --UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSInteger existedLength = textField.text.length;
    NSInteger selectedLength = range.length;
    NSInteger replaceLength = string.length;
    if (string.length == 0) return YES;
    
    switch (self.tag) {
        case 0:
            if (existedLength - selectedLength + replaceLength > 24){return NO;}
            break;
        case 1:
            if (existedLength - selectedLength + replaceLength > 11){return NO;}
            break;
        case 2:
            if (existedLength - selectedLength + replaceLength > 40){return NO;}
            break;
        case 3:
            if (existedLength - selectedLength + replaceLength > 40){return NO;}
            break;
            
        default:
            break;
    }
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [self.textField resignFirstResponder];
    NSLog(@"%@",textField.text);
    if ([self.delegate respondsToSelector:@selector(NewAddressViewEndEditingText:Index:)]) {
        [self.delegate NewAddressViewEndEditingText:textField.text Index:self.tag];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([self.textField.text containsString:@"\n"]) {
        self.textField.text =[self.textField.text stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    }
    [self.textField resignFirstResponder];
    return YES;
}
#pragma mark --UITextViewDelegate
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    [self.textView resignFirstResponder];
    if ([self.delegate respondsToSelector:@selector(NewAddressViewEndEditingText:Index:)]) {
        [self.delegate NewAddressViewEndEditingText:textView.text Index:self.tag];
    }
    NSLog(@"%@",self.textView.text);
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView{
    
    if ([self.textView.text containsString:@"\n"]) {
        self.textView.text =[self.textView.text stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        NSLog(@"%@",self.textView.text);
        [self.textView resignFirstResponder];
    }
}
- (void)setTitleText:(NSString *)titleText{
    _titleText = titleText;
    self.titleLable.text = [NSString stringWithFormat:@"%@:",titleText];
}
- (void)setDetailText:(NSString *)detailText{
    _detailText = detailText;
    if (detailText && detailText.length > 0) {
        if (self.tag == 3) {
            self.textView.text = self.detailText;
        }else{
            self.textField.text = self.detailText;
        }
    }
}
#pragma mark --layoutSubviews
- (void)layoutSubviews{
    [super layoutSubviews];

    CGSize size = [PinMethod sizeWithString:[NSString stringWithFormat:@"%@:",self.titleText] fount:[UIFont systemFontOfSize:18] maxSize:CGSizeMake(self.width/2, self.height)];
    self.titleLable.frame = CGRectMake(5, 0, size.width + 1, self.height - 1);
    if (self.tag == 3) {
        self.textView.frame = CGRectMake(size.width + 1 + 5, 0, self.width - size.width- 6, self.height - 1);
    }else{
        self.textField.frame = CGRectMake(size.width + 1 + 5, 0, self.width - size.width - 6, self.height - 1);
    }
    self.singleLine.frame = CGRectMake(0, self.height - 1, self.width, 1);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
