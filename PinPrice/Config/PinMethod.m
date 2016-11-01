//
//  PinMethod.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/10.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "PinMethod.h"

@implementation PinMethod

+(CGSize)sizeWithString:(NSString *)str fount:(UIFont *)fount maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName:fount};
    
    NSString *string=[str stringByReplacingOccurrencesOfString:@"\\n" withString: @"\n"];
    /**
     *  如果计算的文字的范围超出了制定的范围，返回的就是指定的范围
     *  如果计算的文字的范围小于指定的范围， 返回的就是真实的范围
     */
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    
    return size;
}
+(CGSize)currentScreenSize{
    return [UIScreen mainScreen].bounds.size;
}

+(NSString *)currentModel{
    return [UIDevice currentDevice].model;
}
+ (void)raiseID:(id)value forKey:(NSString *)key{
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}

+(void)delectedValueforKey:(NSString *)key{
    NSUserDefaults *defaults=[NSUserDefaults
                              standardUserDefaults];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
}

+ (NSString *)getValueWithKey:(NSString *)key{
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    return [defaults valueForKey:key];
}
+ (void)writeDataObject:(id)obj ToFile:(NSString *)PathName{
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *fileName = [path stringByAppendingPathComponent:PathName];
    [NSKeyedArchiver archiveRootObject:obj toFile:fileName];
}

+ (void)deleteDataObject:(id)obj FromFile:(NSString *)PathName{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSFileManager *manager =[NSFileManager defaultManager];
    NSString *fileName =[path stringByAppendingString:PathName];
    NSError *error = nil;
    if ([manager fileExistsAtPath:fileName]) {
        [manager removeItemAtPath:fileName error:&error];
        NSLog(@"删除成功");
    }else{
        NSLog(@"找不到要删除的文件");
    }
    
}

//
+(void)addMjRefreshWithTableView:(UITableView *)tableView Target:(id)target WithSelector:(SEL)refreshData WithSelector:(SEL)refreshMoreData{
    
    MJRefreshNormalHeader *mjHeader  = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:refreshData];
    mjHeader.automaticallyChangeAlpha = YES;
    mjHeader.lastUpdatedTimeLabel.hidden = YES;
    
    
    MJRefreshAutoNormalFooter *mjFooter = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:refreshMoreData];
    
    tableView.header = mjHeader;
    tableView.footer = mjFooter;
    
}

+(void)addMjRefreshWithCollectView:(UICollectionView *)collectionView Target:(id)target WithSelector:(SEL)refreshData WithSelector:(SEL)refreshMoreData{
    
    MJRefreshNormalHeader *mjHeader  = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:refreshData];
    mjHeader.automaticallyChangeAlpha = YES;
    mjHeader.lastUpdatedTimeLabel.hidden = YES;
    
    
    MJRefreshAutoNormalFooter *mjFooter = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:refreshMoreData];
    
    collectionView.header = mjHeader;
    collectionView.footer = mjFooter;
    
    [collectionView.header beginRefreshing];
    
}


// 设置label 文字的行间距
+(NSMutableAttributedString *)addLineSpaceWithString:(NSString *)string
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    return attributedString;
}
+(void)addKeyBoardNotificaitonObject:(id) object SelectorShown:(SEL)keyboardWasShown SelectorHidden:(SEL)keyboardWasHidden SelectorFrame:(SEL)keyboardChangeFrame{
    //监听键盘的收缩
    [[NSNotificationCenter defaultCenter] addObserver:object selector:keyboardWasShown name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:object selector:keyboardWasHidden name:UIKeyboardWillHideNotification object:nil];
    //监听键盘deFrame的改变
    [[NSNotificationCenter defaultCenter] addObserver:object selector:keyboardChangeFrame name:UIKeyboardDidChangeFrameNotification object:nil];
    
}

+ (void)limitLength:(UITextField *)textFiled WithLength:(NSInteger)LENGTH_LIMIT {
    BOOL isChinese;
    UITextInputMode *currentInputMode = textFiled.textInputMode;
    if ([[currentInputMode primaryLanguage] isEqualToString:@"en-US"]) {
        isChinese = NO;
    }else{
        isChinese = YES;
    }
    NSString *strText = [[textFiled text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
    if (isChinese) {
        UITextRange *seletedRange = [textFiled markedTextRange];
        UITextPosition *position = [textFiled positionFromPosition:seletedRange.start offset:0];
        if (!position) {
            NSLog(@"汉字输入");
            if (strText.length >= LENGTH_LIMIT) {
                NSString *strNew = [NSString stringWithString:strText];
                [textFiled setText:[strNew substringToIndex:LENGTH_LIMIT - 1]];
            }
        }else{
            NSLog(@"输入的英文还没有转化为汉子的状态");
        }
    }else{
        NSLog(@"str= %@,长度＝ %lu",strText,(unsigned long)[strText length]);
        if ([strText length]>= LENGTH_LIMIT) {
            NSString *strNew = [NSString stringWithString:strText];
            [textFiled setText:[strNew substringToIndex:LENGTH_LIMIT - 1]];
        }
        
    };
    
}
@end
