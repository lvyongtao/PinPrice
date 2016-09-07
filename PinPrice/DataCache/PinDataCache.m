//
//  PinDataCache.m
//  PinPrice
//
//  Created by lvyongtao on 16/9/5.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "PinDataCache.h"

#define DBNAME    @"personinfo.sqlite"
#define ID        @"id"
#define NAME      @"name"
#define AGE       @"age"
#define ADDRESS   @"address"
#define TABLENAME @"PERSONINFO"

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
- (BOOL)creatTableWithTableName:(NSString *)tableName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    self.database_path = [documents stringByAppendingPathComponent:tableName];
    
    self.dataBase = [FMDatabase databaseWithPath:self.database_path];
    if ([self.dataBase open]) {
        NSString *sqlCreateTable =  [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' ('%@' INTEGER PRIMARY KEY AUTOINCREMENT, '%@' TEXT, '%@' INTEGER, '%@' TEXT)",TABLENAME,ID,NAME,AGE,ADDRESS];
        BOOL result = [self.dataBase executeUpdate:sqlCreateTable];
        if (result) {
            NSLog(@"创表成功");
            [self.dataBase close];
            return YES;
        }else{
            NSLog(@"创表失败");
            [self.dataBase close];
            return NO;
        }
        
    }
    return NO;
}
//- (BOOL)selectTableDataWithTableName:(NSString *)tableName{
//
//}


@end
