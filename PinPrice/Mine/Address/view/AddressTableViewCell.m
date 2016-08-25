//
//  AddressTableViewCell.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "AddressTableViewCell.h"

@implementation AddressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _deleteBtn.tag = self.tag;
    _editingBtn.tag = self.tag;
    _setDefaultBtn.tag = self.tag;
    self.selectionStyle = UITableViewCellSelectionStyleBlue;
    // Initialization code
}
- (void)setModel:(AddressModel *)model{
    if (model.name) {
        _titleLable.text = model.name;
    }
    
    if (model.phone) {
        _phoneLable.text = model.phone;
    }
    
    if (model.address && model.detailaddress) {
        _addressLable.text = [model.address stringByAppendingString:model.detailaddress];
    }else if (model.address){
        _addressLable.text = model.address;
    }else{
        _addressLable.text = model.detailaddress;
    }
}
- (IBAction)setDefaultBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(AddressTableViewBtnClick:Tag:)]) {
        [self.delegate AddressTableViewBtnClick:AddressTableViewBtnTypeDefault Tag:self.tag];
    }
    NSLog(@"AddressTableViewBtnTypeDefault");
}
- (IBAction)editingBtncClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(AddressTableViewBtnClick:Tag:)]) {
        [self.delegate AddressTableViewBtnClick:AddressTableViewBtnTypeEditing Tag:self.tag];
    }
    NSLog(@"AddressTableViewBtnTypeEditing");
}
- (IBAction)deleteBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(AddressTableViewBtnClick:Tag:)]) {
        [self.delegate AddressTableViewBtnClick:AddressTableViewBtnTypeDelete Tag:self.tag];
    }
    NSLog(@"AddressTableViewBtnTypeDelete");
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
