//
//  PinGood.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/18.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <Foundation/Foundation.h>


//相关产品model
@interface RelatedGoodsListModel : BaseModel

@property (copy, nonatomic) NSString *imageUrl;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *price;

@end
//商品详情页model
@interface DetailGoodsModel : BaseModel


@property (copy, nonatomic) NSString *imageUrl;
@property (copy, nonatomic) NSString *goodsname;
@property (copy, nonatomic) NSString *goodsprice;
@property (strong, nonatomic) NSArray *relatedgoods;

@end
//猜你喜欢model
@interface LikeGoodsModel : BaseModel

@property (copy, nonatomic) NSString *likeGoodimageUrl;
@property (copy, nonatomic) NSString *likeGoodName;

@property (assign, nonatomic) NSInteger index;

@end
//全部商品model
@interface AllGoodsModel : BaseModel
@property (copy, nonatomic) NSString *allGoodimageUrl;
@property (assign, nonatomic) NSInteger index;
@end
//首页model
@interface PinGood : BaseModel

@property (strong, nonatomic) NSArray <LikeGoodsModel *> *likeGoods;

@property (strong, nonatomic) NSArray <AllGoodsModel *> *allGoods;
@property (nonatomic, copy) NSString *img; // 商品图片地址
@property (nonatomic, copy) NSString *price; // 商品价格

//+ (instancetype)goodWithDict:(NSDictionary *)dict; // 字典转模型
//+ (NSArray *)goodsWithIndex:(NSInteger)index; // 根据索引返回商品数组
@end
//下订单model
@interface PlaceOrderModel :BaseModel

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *descname;
@property (copy, nonatomic) NSString *price;
@property (copy, nonatomic) NSString *imageUrl;
@property (copy, nonatomic) NSString *postage;
@property (copy, nonatomic) NSString *ordernum;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *username;
@end
