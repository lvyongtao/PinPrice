//
//  PinDataCache.m
//  PinPrice
//
//  Created by lvyongtao on 16/9/5.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "PinDataCache.h"
/**
 *  我的收藏
 *
 *  @return type key
 */
#define COLLECTDBNAME   @"collect.sqlite"
#define ID              @"id"
#define IMAGEURL        @"imageUrl"
#define TITLE           @"title"
#define DESCTITLE       @"desctitle"
#define SIZE            @"size"
#define PRICE           @"price"
#define STATE           @"state"
#define COLLECTNAME     @"t_collect"

@interface PinDataCache ()

@end

static PinDataCache *cache = nil;

@implementation PinDataCache

+ (PinDataCache *)shareCache{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[PinDataCache alloc] init];
    });
    return cache;
}
- (instancetype)init{
    if (self = [super init]) {}
    return self;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    @synchronized(self) {
        if (!cache) {
            cache = [super allocWithZone:zone];
            return cache;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone{
    return self;
}
- (BOOL)WhetherCollectionTableCreateSuccess{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    _database_path = [documents stringByAppendingPathComponent:COLLECTDBNAME];
    
    _dataBase = [FMDatabase databaseWithPath:_database_path];
    if ([self.dataBase open]) {
        NSString *sqlCreateTable =  [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' ('%@' INTEGER PRIMARY KEY AUTOINCREMENT, '%@' TEXT, '%@' TEXT, '%@' TEXT, '%@' TEXT, '%@' TEXT, '%@' TEXT)",COLLECTNAME,ID,IMAGEURL,TITLE,DESCTITLE,SIZE,PRICE,STATE];
        BOOL result = [self.dataBase executeUpdate:sqlCreateTable];
        if (result) {
            NSLog(@"创表成功");
            [_dataBase close];
            return YES;
        }else{
            NSLog(@"创表失败");
            [_dataBase close];
            return NO;
        }
        
    }
    return NO;
}
- (NSArray *)selectTableDataSucess{
    [_dataBase open];
    NSString *sql = [NSString stringWithFormat:@"select %@,ID from %@",COLLECTDBNAME,COLLECTNAME];
    FMResultSet *set = [_dataBase executeQuery:sql];
    NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:0];
    CollectModel *model = [[CollectModel alloc] init];
    while ([set next]) {
        model.imageUrl = [set stringForColumn:IMAGEURL];
        model.title = [set stringForColumn:TITLE];
        model.desctitle = [set stringForColumn:DESCTITLE];
        model.size = [set stringForColumn:SIZE];
        model.price = [set stringForColumn:PRICE];
        model.state = [set stringForColumn:STATE];
        [tempArr addObject:model];
    }
    [_dataBase close];
    return [tempArr copy];
    
}
- (BOOL)deleteTableDataSucess{
    [_dataBase open];
    return [_dataBase executeUpdateWithFormat:@"delete from %@",COLLECTNAME];
}
- (BOOL)insertTableDataSucess{
    NSArray *tempArr = [self selectTableDataSucess];
    [_dataBase open];
    if ([tempArr count]) {
        [self deleteTableDataSucess];
    }
    return NO;
    
}

@end
