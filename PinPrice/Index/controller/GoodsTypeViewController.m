//
//  GoodsTypeViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/9/1.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#define GOODSVIEW_H 400
#define cellH 88
#define GOODSTYPE_BTN_H 50
#import "GoodsTypeViewController.h"
#import "XWInteractiveTransition.h"
#import "XWPresentOneTransition.h"

#import "GoodTypeView.h"
@interface GoodsTypeViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) XWInteractiveTransition *interactiveDismiss;
@property (nonatomic, strong) XWInteractiveTransition *interactivePush;


//back button
@property (strong, nonatomic) UIButton *backBtn;
//订单详情
@property (strong, nonatomic) UILabel *backLable;
//确认商品信息button
@property (strong, nonatomic) UIButton *okBtn;

@property (strong, nonatomic) GoodTypeView *typeView;

@end

@implementation GoodsTypeViewController
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
    [self initBackView];
    // Do any additional setup after loading the view.
}
#pragma mark --init
- (void)initBackView{
    [self.backBtn setImage:[UIImage imageNamed:@"shop_close"] forState:UIControlStateNormal];
    [self.backLable setText:@"选择商品类型"];
    [self.okBtn setTitle:@"确认" forState:UIControlStateNormal];
    
    self.typeView.backgroundColor =[UIColor whiteColor];

}
#pragma mark --lazyload
- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.backgroundColor = [UIColor clearColor];
        _backBtn.frame = CGRectMake(WIDTH - GOODSTYPE_BTN_H,0, GOODSTYPE_BTN_H, GOODSTYPE_BTN_H);
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
        _backLable.frame = CGRectMake(10, 0, WIDTH - GOODSTYPE_BTN_H - 20, GOODSTYPE_BTN_H);
        _backLable.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:_backLable];
    }
    return _backLable;
}
- (UIButton *)okBtn{
    if (!_okBtn) {
        _okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _okBtn.backgroundColor = RGBCOLOR(255, 79, 80);
        _okBtn.frame = CGRectMake(0, GOODSVIEW_H - GOODSTYPE_BTN_H, WIDTH, GOODSTYPE_BTN_H);
        _okBtn.userInteractionEnabled = YES;
        [_okBtn addTarget:self action:@selector(okBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_okBtn];
    }
    return _okBtn;
}
- (GoodTypeView *)typeView{
    if (!_typeView) {
        _typeView =[[GoodTypeView alloc] init];
        _typeView.frame = CGRectMake(0, GOODSTYPE_BTN_H, WIDTH, GOODSVIEW_H - GOODSTYPE_BTN_H*2);
        [self.view addSubview:_typeView];
    }
    return _typeView;
}
#pragma mark --action
- (void)okBtnClick:(UIButton *)btn{
    //    BuyGoodsViewController *buy = [[BuyGoodsViewController alloc] init];
    //    buy.type = 1;
    //    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:buy];
    ////    [self presentViewController:buy animated:YES completion:nil];
    //    [self presentViewController:nav animated:YES completion:nil];
    
    [self showMessageTitle:@"商品类型选择成功"];
    self.backType = GoodsViewDissMissTypeOk;
    [self dismiss];
    
    
}
- (void)backBtnClick:(UIButton *)btn{
    self.backType = GoodsViewDissMissTypeBack;
    [self dismiss];
}
#pragma mark --自定义手势转场动画
- (void)initInteractiveTransition{
    self.interactiveDismiss = [XWInteractiveTransition interactiveTransitionWithTransitionType:XWInteractiveTransitionTypeDismiss GestureDirection:XWInteractiveTransitionGestureDirectionRight];
    [self.interactiveDismiss addPanGestureForViewController:self];
}
//按钮点击返回购物车
- (void)dismiss{
    if (_delegate && [_delegate respondsToSelector:@selector(presentedGoodsTypeViewControllerDissmissWithType:)]) {
        [_delegate presentedGoodsTypeViewControllerDissmissWithType:self.backType];
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
