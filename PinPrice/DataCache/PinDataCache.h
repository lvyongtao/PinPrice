//
//  PinDataCache.h
//  PinPrice
//
//  Created by lvyongtao on 16/9/5.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "BaseModel.h"

@interface PinDataCache : BaseModel

+ (PinDataCache *)shareCache;

/**
 *  声明的属性
 */
@property (copy, nonatomic) NSString *database_path;
@property (strong, nonatomic) FMDatabase *dataBase;
/**
 *  创表
 *
 *  @param tableName 表名
 *
 *  @return  是否创建成功 Default NO
 */
- (BOOL )creatTableWithTableName:(NSString *)tableName;


- (BOOL )insertTableDataWithTableName:(NSString *)tableName;

- (BOOL )selectTableDataWithTableName:(NSString *)tableName;

- (BOOL )deleteTableDataWithTableName:(NSString *)tableName;

@end
