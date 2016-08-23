//
//  ShopTableViewCell.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/10.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//




#define cellH 150
#define SPACE_LINE 5
#import "ShopTableViewCell.h"


@implementation ShopTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self viewdidload];
    }
    return self;
}

- (void)viewdidload{
    
    _iconImage = [[UIImageView alloc] init];
    _iconImage.backgroundColor = [UIColor redColor];
    _iconImage.contentMode = UIViewContentModeScaleAspectFill;
    _iconImage.clipsToBounds = YES;
    [self.contentView addSubview:_iconImage];
    
    
    _titleLable = [[UILabel alloc] init];
//    _titleLable.text = @"短袖";
    _titleLable.textColor = [UIColor blackColor];
    _titleLable.backgroundColor = [UIColor clearColor];
    _titleLable.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:_titleLable];
    
    _descLable = [[UILabel alloc] init];
//    _descLable.text = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    _descLable.textColor = [UIColor blackColor];
    _descLable.backgroundColor = [UIColor clearColor];
    _descLable.numberOfLines = 0;
    _descLable.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_descLable];
    
    
    _priceLable = [[UILabel alloc] init];
//    _priceLable.text = @"¥45.00\n黑色";
    _priceLable.textColor = [UIColor blackColor];
    _priceLable.backgroundColor = [UIColor clearColor];
    _priceLable.numberOfLines = 0;
    _priceLable.textAlignment = NSTextAlignmentRight;
    _priceLable.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:_priceLable];
    
    _typeLable = [[UILabel alloc] init];
    //    _priceLable.text = @"¥45.00\n黑色";
    _typeLable.textColor = [UIColor blackColor];
    _typeLable.backgroundColor = [UIColor clearColor];
    _typeLable.numberOfLines = 0;
    _typeLable.textAlignment = NSTextAlignmentRight;
    _typeLable.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:_typeLable];
    
    
    
    _shopNumView = [[ShopNumView alloc] init];
    _shopNumView.backgroundColor = [UIColor clearColor];
    _shopNumView.delegate = self;
    [self.contentView addSubview:_shopNumView];
    


       [_shopNumView viewdidload];
}
- (void)setValueWithModel:(ShoppingModel *)model{
    if (model.maxnum) {
        _shopNumView.maxNum = [model.maxnum intValue];
    }
    if (model.imageUrl) {
        [_iconImage sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
    }
    if (model.title) {
        _titleLable.text = model.title;
    }
    if (model.desctitle) {
        _descLable.text = model.desctitle;
    }
    if (model.price) {
        _priceLable.text = [NSString stringWithFormat:@"%@",model.price];
    }
    if(model.color){
        _typeLable.text = model.color;
    }
}
- (void)numButtonClickNumString:(NSString *)numString{
    if ([self.delegate respondsToSelector:@selector(shopButtonClickNumString:ButtonTag:)]) {
        [self.delegate shopButtonClickNumString:numString ButtonTag:self.tag];
    }
   
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    __weak typeof(self)weakSelf = self;
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.contentView.mas_left).offset(SPACE_LINE);
        make.top.equalTo(weakSelf.contentView.mas_top).offset(SPACE_LINE);
        make.width.height.offset(cellH - SPACE_LINE*2);
    }];
    
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconImage.mas_top);
        make.left.equalTo(_iconImage.mas_right).offset(SPACE_LINE);
        make.right.equalTo(_priceLable.mas_left).offset(- SPACE_LINE);
        make.height.offset(cellH/4);
    }];
    
    [_descLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLable.mas_bottom).offset(- SPACE_LINE*2);
        make.left.equalTo(_iconImage.mas_right).offset(SPACE_LINE);
        make.width.offset(WIDTH/3 - SPACE_LINE);
        make.height.offset(cellH*3/8 + SPACE_LINE*2);
    }];
    [_priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconImage.mas_top);
        make.right.equalTo(weakSelf.mas_right).offset(- SPACE_LINE);
        make.left.equalTo(_titleLable.mas_right);
        make.height.offset(cellH/4);
//        make.bottom.equalTo(_typeLable.mas_top);
    }];
    
//    [_typeLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_priceLable.mas_bottom);
//        make.right.equalTo(weakSelf.mas_right).offset(- SPACE_LINE);
//        make.left.equalTo(_descLable.mas_right);
//        make.height.offset(cellH/4);
//    }];

    [_shopNumView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_descLable.mas_bottom).offset(5);
        make.left.equalTo(_descLable.mas_left);
        make.right.equalTo(weakSelf.mas_right).offset(- SPACE_LINE);
        make.height.offset(cellH*3/8 - SPACE_LINE*4);
        //        make.right.equalTo(weakSelf.contentView.mas_bottom).offset(-5);
        //        make.bottom.equalTo(weakSelf.mas_bottom).offset(-5);
    }];
    


}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
