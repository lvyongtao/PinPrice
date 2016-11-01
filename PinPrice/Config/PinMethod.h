//
//  PinMethod.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/10.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PinMethod : NSObject
///计算文字的宽高
+ (CGSize)sizeWithString:(NSString *)str fount:(UIFont *)fount maxSize:(CGSize)maxSize;
/**
 *  获取屏幕尺寸
 */
+(CGSize)currentScreenSize;
/**
 *  获取当前的设备型号
 */
+(NSString *)currentModel;

/**
 *   NSUserDefaults   ADD
 */
+ (void)raiseID:(id)value forKey:(NSString *)key;

/**
 *  NSUserDefaults    DELECT
 */
+ (void)delectedValueforKey:(NSString *)key;
/**
 *  NSUserDefaults      GET
 *
 */
+ (NSString *)getValueWithKey:(NSString *)key;
/**
 *  存档
 *
 *  @param obj      存储的对象
 *  @param PathName 存储的文件名称
 */
+ (void)writeDataObject:(id)obj ToFile:(NSString *)PathName;

/**
 *  删档
 */
+ (void)deleteDataObject:(id)obj FromFile:(NSString *)PathName;
/**
 *   add MJRefresh 控件
 *
 *  @param tableView       加载的父视图
 *  @param refreshData     实现下拉刷新的方法
 *  @param refreshMoreData 实现上拉加载更过数据的方法
 */
+(void)addMjRefreshWithTableView:(UITableView *)tableView Target:(id)target WithSelector:(SEL)refreshData WithSelector:(SEL)refreshMoreData;
/**
 *   add MJRefresh 控件
 *
 *  @param UICollectionView       加载的父视图
 *  @param refreshData     实现下拉刷新的方法
 *  @param refreshMoreData 实现上拉加载更过数据的方法
 */
+(void)addMjRefreshWithCollectView:(UICollectionView *)collectionView Target:(id)target WithSelector:(SEL)refreshData WithSelector:(SEL)refreshMoreData;
/**
 *  设置Lable 的行间距
 */
+(NSMutableAttributedString *)addLineSpaceWithString:(NSString *)string;

/**
 *  KeyBoardNotificaiton
 *
 *  @param keyboardWasShown
 *  @param keyboardWasHidden
 *  @param keyboardChangeFrame
 */
+(void)addKeyBoardNotificaitonObject:(id) object SelectorShown:(SEL)keyboardWasShown SelectorHidden:(SEL)keyboardWasHidden SelectorFrame:(SEL)keyboardChangeFrame;

/**
 *  添加字符串限制
 */
+ (void)limitLength:(UITextField *)textFiled WithLength:(NSInteger)LENGTH_LIMIT;
@end
