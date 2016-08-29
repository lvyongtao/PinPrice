//
//  PayForCartViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/25.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define PAYVIEW_H 400
#define cellH 88
#define PAYORDER_BTN_H 50

#import "PayForCartViewController.h"
#import "XWInteractiveTransition.h"
#import "XWPresentOneTransition.h"

#import "PayCartModel.h"
#import "PayCartTableViewCell.h"

#import "BuyGoodsViewController.h"

@interface PayForCartViewController ()<UIViewControllerTransitioningDelegate,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate>

@property (nonatomic, strong) XWInteractiveTransition *interactiveDismiss;
@property (nonatomic, strong) XWInteractiveTransition *interactivePush;
//立即下单button
@property (strong, nonatomic) UIButton *payOrderBtn;
//back button
@property (strong, nonatomic) UIButton *backBtn;
//订单详情
@property (strong, nonatomic) UILabel *backLable;
//购物车视图
@property (strong, nonatomic) UITableView *payTableView;



@end
static NSString *const cellID = @"PayCartTableViewCell";
@implementation PayForCartViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self initInteractiveTransition];
    [self initTableView];
    // Do any additional setup after loading the view.
}
- (void)initTableView{
    [self.payOrderBtn setTitle:@"立即下单" forState:UIControlStateNormal];
    [self.backBtn setImage:[UIImage imageNamed:@"shop_close"] forState:UIControlStateNormal];
    [self.backLable setText:@"确认订单"];
    [self.payTableView reloadData];
}
#pragma mark --lazyload
- (UITableView *)payTableView{
    if (!_payTableView) {
        _payTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, PAYORDER_BTN_H, WIDTH, PAYVIEW_H - PAYORDER_BTN_H*2) style:UITableViewStyleGrouped];
        _payTableView.showsVerticalScrollIndicator = NO;
        _payTableView.showsHorizontalScrollIndicator = NO;
        _payTableView.backgroundColor = [UIColor clearColor];
        _payTableView.bounces = NO;
        _payTableView.userInteractionEnabled = YES;
        _payTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _payTableView.delegate = self;
        _payTableView.dataSource = self;
        [_payTableView registerNib:[UINib nibWithNibName:@"PayCartTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellID];
        [self.view addSubview:_payTableView];
    }
    return _payTableView;
}

- (NSMutableArray *)payGoods{
    if (!_payGoods) {
        _payGoods =[[NSMutableArray alloc] init];
    }
    return _payGoods;
}
- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.backgroundColor = [UIColor clearColor];
        _backBtn.frame = CGRectMake(WIDTH - PAYORDER_BTN_H,0, PAYORDER_BTN_H, PAYORDER_BTN_H);
        _backBtn.userInteractionEnabled = YES;
        [_backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_backBtn];
    }
    return _backBtn;
}
- (UILabel *)backLable{
    if (!_backLable) {
        _backLable = [[UILabel alloc] init];
        _backLable.backgroundColor = [UIColor clearColor];
        _backLable.frame = CGRectMake(10, 0, WIDTH - PAYORDER_BTN_H - 20, PAYORDER_BTN_H);
        _backLable.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:_backLable];
    }
    return _backLable;
}
- (UIButton *)payOrderBtn{
    if (!_payOrderBtn) {
        _payOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _payOrderBtn.backgroundColor = RGBCOLOR(255, 79, 80);
        _payOrderBtn.frame = CGRectMake(0, PAYVIEW_H - PAYORDER_BTN_H, WIDTH, PAYORDER_BTN_H);
        _payOrderBtn.userInteractionEnabled = YES;
        [_payOrderBtn addTarget:self action:@selector(payOrderBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_payOrderBtn];
    }
    return _payOrderBtn;
}
#pragma mark --action
- (void)payOrderBtnClick:(UIButton *)btn{
//    BuyGoodsViewController *buy = [[BuyGoodsViewController alloc] init];
//    buy.type = 1;
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:buy];
////    [self presentViewController:buy animated:YES completion:nil];
//    [self presentViewController:nav animated:YES completion:nil];
    
    [self showMessageTitle:@"下单成功"];
    NSLog(@"立即下单");
    
}
- (void)backBtnClick:(UIButton *)btn{
    
    [self dismiss];
}
#pragma mark
#pragma mark ——UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.payGoods count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PayCartTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.tag = indexPath.row;
    if (self.payGoods &&[self.payGoods count]> 0) {
        cell.model = self.payGoods[indexPath.row];
    }
    return cell;
}
#pragma mark ——UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellH;
}
//设置section的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:( NSInteger)section{
    if (section == 0) {
        return 1.0;
    }
    return 10.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
//返回的是编辑样式(删除还是添加)
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
    
}

#pragma mark --自定义手势转场动画
- (void)initInteractiveTransition{
    self.interactiveDismiss = [XWInteractiveTransition interactiveTransitionWithTransitionType:XWInteractiveTransitionTypeDismiss GestureDirection:XWInteractiveTransitionGestureDirectionRight];
    [self.interactiveDismiss addPanGestureForViewController:self];
}
//按钮点击返回购物车
- (void)dismiss{
    if (_delegate && [_delegate respondsToSelector:@selector(presentedPayForCartViewControllerDissmiss)]) {
        [_delegate presentedPayForCartViewControllerDissmiss];
    }
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [XWPresentOneTransition transitionWithTransitionType:XWPresentOneTransitionTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [XWPresentOneTransition transitionWithTransitionType:XWPresentOneTransitionTypeDismiss];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return _interactiveDismiss.interation ? _interactiveDismiss : nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    XWInteractiveTransition *interactivePresent = [_delegate interactiveTransitionForPresent];
    return interactivePresent.interation ? interactivePresent : nil;
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
