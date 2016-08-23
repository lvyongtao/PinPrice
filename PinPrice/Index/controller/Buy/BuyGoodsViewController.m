//
//  BuyGoodsViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/23.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "BuyGoodsViewController.h"

@interface BuyGoodsViewController ()

@end

@implementation BuyGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavgationBar];
    // Do any additional setup after loading the view.
}
- (void)initNavgationBar{
    [self addTitleViewWithTitle:@"订单"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
