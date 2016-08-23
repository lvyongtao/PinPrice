//
//  GoodCollectionViewLayout.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/17.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "GoodCollectionViewLayout.h"
#import "PinGood.h"

#define MINLINESPACEING 5
@interface GoodCollectionViewLayout ()

@property (nonatomic,assign)NSInteger numberOfColums;
@property (nonatomic,assign)NSInteger currentColum;
@property (nonatomic,assign)CGFloat minY;
@property (nonatomic,strong)NSMutableDictionary *lastLineInfo;
@property (nonatomic,strong)NSMutableArray *layoutInfo;

@end

@implementation GoodCollectionViewLayout


//布局前的准备
- (void)prepareLayout{
    //设置列数
    self.numberOfColums = 2;
    self.layoutInfo = [NSMutableArray array];
    self.lastLineInfo = [NSMutableDictionary dictionary];
    CGFloat cellW = (self.collectionView.frame.size.width - (MINLINESPACEING * (self.numberOfColums + 1))) / self.numberOfColums;
    //    x,y,H;
    
    NSInteger section = [self.collectionView numberOfSections];
    for (int  i = 0; i < section; i++) {
        NSInteger row = [self.collectionView numberOfItemsInSection:i];
        for (int j = 0; j < row; j++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:i];
            //每个cell的描述
            UICollectionViewLayoutAttributes *item = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat H = [(id<GoodCollectionViewLayoutDelegate>)self.collectionView.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
            for (int k = 0; k < self.numberOfColums; k++) {
                if (self.minY >= [self.lastLineInfo[@(k)] floatValue]) {
                    self.minY = [self.lastLineInfo[@(k)] floatValue];
                    self.currentColum = k;
                    if (self.minY == 0) {
                        self.minY += MINLINESPACEING;
                        break;
                    }
                }
            }
            CGFloat x = (self.currentColum % self.numberOfColums) * (cellW + MINLINESPACEING) + MINLINESPACEING;
            item.frame = CGRectMake(x, self.minY, cellW, H);
            self.minY += H;
            self.minY += MINLINESPACEING;
            self.lastLineInfo[@(self.currentColum)] = @(self.minY);
            [self.layoutInfo addObject:item];
        }
    }
    
}
//可见的cell的所有描述，包括frame，各种状态
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *temp = [NSMutableArray array];
    [self.layoutInfo enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *obj, NSUInteger idx, BOOL *stop) {
        //        obj.frame rect
        //CGRectIntersectsRect判断2个矩形有没有交集
        BOOL intersects = CGRectIntersectsRect(obj.frame, rect);
        NSLog(@"%@--%@",NSStringFromCGRect(obj.frame),NSStringFromCGRect(rect));
        if (intersects) {
            [temp addObject:obj];
        }
    }];
    return temp;
}
- (CGSize)collectionViewContentSize{
    CGFloat height = 0;
    for (int i = 0; i < self.numberOfColums; i++) {
        if (height < [self.lastLineInfo[@(i)] floatValue]) {
            height = [self.lastLineInfo[@(i)] floatValue];
        }
    }
    return CGSizeMake(self.collectionView.width, height);
}
@end
