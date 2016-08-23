//
//  GoodCollectionViewLayout.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/17.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GoodCollectionViewLayout;
@protocol GoodCollectionViewLayoutDelegate <NSObject>

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(GoodCollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface GoodCollectionViewLayout : UICollectionViewLayout<UICollectionViewDelegateFlowLayout>

// 总列数
@property (nonatomic, assign) NSInteger columnCount;
// 商品数据数组
@property (nonatomic, strong) NSArray *goodsList;

@end
