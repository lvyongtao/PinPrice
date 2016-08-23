//
//  PinTabBarController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/8.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "PinTabBarController.h"
#import "RootViewController.h"
#import "IndexViewController.h"
#import "AssertmentViewController.h"
#import "ShoppingCartViewController.h"
#import "MineViewController.h"

@implementation PinTabBarController
+ (void)initialize{
    UITabBarItem *appearance = [UITabBarItem appearance];
    NSDictionary *attrs = @{NSForegroundColorAttributeName:[UIColor colorWithWhite:0.1 alpha:1.0]};
    NSDictionary *arrts_h = @{NSForegroundColorAttributeName:RGBCOLOR(0, 158, 237)};
    [appearance setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [appearance setTitleTextAttributes:arrts_h forState:UIControlStateSelected];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initTabBar];
}
- (void)initTabBar{

    NSArray *imgArray=@[@"Index@2x",@"Assortment@2x",@"ShoppingCart@2x",@"Mine@2x"];
    NSArray *selectImage=@[@"Index_selected@2x",@"Assortment_selected@2x",@"ShoppingCart_selected@2x",@"Mine_selected@2x"];
    NSArray *names=@[@"IndexViewController",@"AssertmentViewController",@"ShoppingCartViewController",@"MineViewController"];
    NSArray *titles = @[@"首页",@"分类",@"购物车",@"我的"];
    
    for (int i=0; i<names.count; i++) {
        Class class=NSClassFromString(names[i]);
        RootViewController *root=[[class alloc] init];
        [self addChlildVC:root imageName:imgArray[i] selectedImageName:selectImage[i] title:titles[i]];
    }
}

#pragma mark--setImage
- (void)addChlildVC:(UIViewController *)childVC imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName title:(NSString *)title{

    childVC.tabBarItem.imageInsets=UIEdgeInsetsMake(-3, 0, 3, 0);
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.image = image;
    childVC.tabBarItem.title = title;
    [childVC.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = selectedImage;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVC];
    
    [self addChildViewController:nav];
}

@end
