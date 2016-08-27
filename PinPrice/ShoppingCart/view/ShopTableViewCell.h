//
//  ShopTableViewCell.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/10.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopNumView.h"
#import "ShoppingModel.h"

@protocol ShopButtonClickDelegate <NSObject>

- (void)shopButtonClickNumString:(NSString *)numString ButtonTag:(NSInteger )buttonTag;

@end

@interface ShopTableViewCell : UITableViewCell<ShopNumDelegate>

@property (weak, nonatomic) id<ShopButtonClickDelegate >delegate;

@property (strong, nonatomic) UIImageView *iconImage;

@property (strong, nonatomic) UILabel *titleLable;

@property (strong, nonatomic) UILabel *descLable;

@property (strong, nonatomic) UILabel *priceLable;

@property (strong, nonatomic) UILabel *typeLable;

@property (strong, nonatomic) ShopNumView *shopNumView;

- (void)setValueWithModel:(ShoppingModel *)model;

- (BOOL )setSelfColorSelected:(BOOL )isSelected;

@end
