//
//  CollectModel.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/18.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "CollectModel.h"

@implementation CollectModel
- (void)encodeWithCoder:(NSCoder *)aCoder{
    /**
     *  @property (copy, nonatomic) NSString *imageUrl;
     @property (copy, nonatomic) NSString *title;
     @property (copy, nonatomic) NSString *desctitle;
     @property (copy, nonatomic) NSString *size;
     @property (copy, nonatomic) NSString *price;
     @property (copy, nonatomic) NSString *state;
     */
    [aCoder encodeObject:self.imageUrl forKey:@"imageUrl"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.desctitle forKey:@"desctitle"];
    [aCoder encodeObject:self.size forKey:@"size"];
    [aCoder encodeObject:self.price forKey:@"price"];
    [aCoder encodeObject:self.state forKey:@"state"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.imageUrl = [aDecoder decodeObjectForKey:@"imageUrl"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.desctitle = [aDecoder decodeObjectForKey:@"desctitle"];
        self.size = [aDecoder decodeObjectForKey:@"size"];
        self.price = [aDecoder decodeObjectForKey:@"price"];
        self.state = [aDecoder decodeObjectForKey:@"state"];
    }
    return self;
}
@end
