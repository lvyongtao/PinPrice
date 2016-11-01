//
//  RootViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/8.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "RootViewController.h"
#import <CoreText/CoreText.h>

@interface RootViewController ()

@property (nonatomic,strong) UIImageView* noDataView;
@end

@implementation RootViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//     _isShowTabbar = YES;
//    self.hidesBottomBarWhenPushed = YES;
    
    [self creatBackBtnStyle];
}
#pragma mark - NavgationItem.set
- (void)setUpNav{
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -64) forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - table.set
-(void)viewDidLayoutSubviews{
    __block UITableView* table;
    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UITableView class]]) {
            table=obj;
        }
    }];
    if ([table respondsToSelector:@selector(setSeparatorInset:)]) {
        [table setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([table respondsToSelector:@selector(setLayoutMargins:)]) {
        [table setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)showNoDataImage{
    _noDataView=[[UIImageView alloc] init];
    [_noDataView setImage:[UIImage imageNamed:@"generl_nodata"]];
    [self.view.subviews enumerateObjectsUsingBlock:^(UITableView* obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UITableView class]]) {
            [_noDataView setFrame:CGRectMake(0, 0,obj.frame.size.width, obj.frame.size.height)];
            [obj addSubview:_noDataView];
        }
    }];
}

-(void)removeNoDataImage{
    if (_noDataView) {
        [_noDataView removeFromSuperview];
    }
}

- (void)showLoadingAnimation{
    [UIView MBAlertViewShowWith:self.view];
   
}

- (void)stopLoadingAnimation{
    [UIView MBHiddenAllWith: self.view];
}
#pragma mark --showAlert
+(void)showAlertWithTitle:(NSString *)title message:(NSString *)message{
    
    if (FSystemVersion >= 8.0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"人体成分检测" message:@"您成功完成一次体测，是否现在查看体测结果？" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"查看" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        UIAlertAction *cancaleAction = [UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:okAction];
        [alert addAction:cancaleAction];
//        [self presentViewController:alert animated:YES completion:nil];
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"人体成分检测"  message:@"您成功完成一次体测，是否现在查看体测结果？"  delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:@"查看", nil];
        alert.tag = 100;
        [alert show];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
- (void)showMessageTitle:(NSString *)title{
    [UIView MBAlertViewWithMsg:title With:self.view];
    [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(removeMBAlertView:) userInfo:nil repeats:NO];
}
- (void)removeMBAlertView:(NSTimer *)timer{
    [UIView MBHiddenAllWith:self.view];
    [timer invalidate];
}
- (void)clearUserInfo{
    [PinUserInfo deletePassword];
    [PinUserInfo deleteUserID];
    [PinUserInfo deletePhone];
}
- (void)cleanMemory{
    [[SDImageCache sharedImageCache] cleanDiskWithCompletionBlock:^{
        NSLog(@"清除缓存成功");
    }];
    [[SDImageCache sharedImageCache] clearMemory];
}
- (void)initNavgationBar{
    
}
//设置系统返回按钮
-(void)creatBackBtnStyle{
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor blackColor]}];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.tintColor = RGBCOLOR(225, 225, 225);
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : RGBCOLOR(225, 225, 225)}];
}
///创建导航栏标题
-(void)addTitleViewWithTitle:(NSString *)title
{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH/3, 0, WIDTH/3, 35)];
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:16];
    label.textColor= [UIColor blackColor];
    //    label.text=title;
    label.backgroundColor=[UIColor clearColor];
    
    NSMutableAttributedString *attributedString =[[NSMutableAttributedString alloc]initWithString:title];
    long number = 0.0f;//间距
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[attributedString length])];    CFRelease(num);
    [label setAttributedText:attributedString];
    
    self.navigationItem.titleView=label;
    
}
//导航栏设置左侧按钮
-(void)addLeftBtnWithTitle:(NSString *)title withImage:(UIImage *)image WithTitleColor:(UIColor *)color withTarget:(id)target withMethod:(SEL)select
{
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    leftBtn.backgroundColor =[UIColor redColor];
    leftBtn.frame=CGRectMake(0, 0,WIDTH/4, 20);
    [leftBtn setTitle:title forState:UIControlStateNormal];
    if (image) {
        [leftBtn setImage:image forState:UIControlStateNormal];
        //        [leftBtn setBackgroundColor:[UIColor redColor]];
//        float width=[PinMethod sizeWithString:title fount:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(WIDTH, 35)].width;
        leftBtn.imageEdgeInsets=UIEdgeInsetsMake(0,0, 0,WIDTH/4 - 15);
//        leftBtn.titleEdgeInsets=UIEdgeInsetsMake(2, -40, 0, leftBtn.frame.size.width-width-30);
    }
    [leftBtn addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitleColor:color forState:UIControlStateNormal];
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    
    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItems=@[negativeSpacer,item];
    
}
//导航栏设置右侧按钮
-(UIButton *)addRightBtnWithTitle:(NSString *)title withImage:(UIImage *)image withTitleColor:(UIColor *)color withTarget:(id)target withMethod:(SEL)select
{
    
    UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame=CGRectMake(0, 0, WIDTH/4, 35);
    rightBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [rightBtn setTitleColor:color forState:UIControlStateNormal];
    if (title) {
        [rightBtn setTitle:title forState:UIControlStateNormal];
    }
    if (image) {
        [rightBtn setImage:image forState:UIControlStateNormal];
    }
    if (image && title) {
        
         float width=[PinMethod sizeWithString:title fount:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(WIDTH, 35)].width;
        rightBtn.imageEdgeInsets=UIEdgeInsetsMake(5, rightBtn.frame.size.width-35, 0, 0);
        rightBtn.titleEdgeInsets=UIEdgeInsetsMake(0,-width*3/4, 0, 28);
    }
    [rightBtn addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    
    negativeSpacer.width = -20;
    self.navigationItem.rightBarButtonItems=@[negativeSpacer,item];
    
    return rightBtn;
    
}

//导航栏设置右侧按钮
-(void)addRightBtnswithImage1:(UIImage *)image1 withImage2:(UIImage *)image2 withTitleColor:(UIColor *)color withTarget:(id)target withMethod:(SEL)select{
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, WIDTH/4 + 20, kTopBarHeight);
    view.backgroundColor = [UIColor clearColor];
    for (int i = 0; i <2; i ++) {
        UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame=CGRectMake(i*WIDTH/8 + i*10, 0, WIDTH/8, kTopBarHeight);
        rightBtn.tag = i;
        rightBtn.titleLabel.font=[UIFont systemFontOfSize:16];
        [rightBtn setTitleColor:color forState:UIControlStateNormal];
        [rightBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        if (image1 && i==0) {
            [rightBtn setImage:image1 forState:UIControlStateNormal];
        }
        if (image1 && i==1) {
            [rightBtn setImage:image2 forState:UIControlStateNormal];
        }
        [rightBtn addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:rightBtn];
    }
    
    
    
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:view];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    
    negativeSpacer.width = -20;
    self.navigationItem.rightBarButtonItems=@[negativeSpacer,item];
    
}
#pragma mark 创建导航栏左侧按钮
-(UIButton*)createLeftButtonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor *)color imageName:(NSString*)imageName target:(id)target method:(SEL)select
{
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame=frame;
    [button setTitleColor:color forState:UIControlStateNormal];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (imageName) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        button.imageEdgeInsets=UIEdgeInsetsMake(3, 0, 3, frame.size.width-35);
        //        [leftBtn setBackgroundColor:[UIColor redColor]];
    }
    if (title.length>0 && imageName) {
        float width1=[PinMethod sizeWithString:title fount:[UIFont systemFontOfSize:20] maxSize:CGSizeMake(1000, 1000)].width;
        
        button.titleEdgeInsets=UIEdgeInsetsMake(0, -30, 0,frame.size.width-30-width1);
        button.imageEdgeInsets=UIEdgeInsetsMake(3, -8, 3, frame.size.width-25);
    }
    [button addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    
    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItems=@[negativeSpacer,item];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    return button;
}
@end
