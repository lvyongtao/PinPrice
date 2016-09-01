//
//  ShoppingCartViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/8.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define cellH 150
#define TOOLVIEW_H 50
#import "ShoppingCartViewController.h"
#import "ShopTableViewCell.h"
#import "ShoppingModel.h"
#import "ShopToolView.h"
#import "PayForCartViewController.h"

#import "XWInteractiveTransition.h"
#import "XWPresentOneTransition.h"

@interface ShoppingCartViewController ()<UITableViewDelegate,UITableViewDataSource,ShopButtonClickDelegate,ShopToolViewBtnClickDelegate,PayForCartViewControllerDelegate>

@property (strong, nonatomic) ShopToolView *toolView;//结算工具视图
@property (strong, nonatomic) UITableView *shopTableView;//购物车视图
@property (strong, nonatomic) NSMutableArray *shopBuys;//购物车列表
@property (strong, nonatomic) NSMutableArray *clearings;//购买列表
@property (assign, nonatomic) int totalPrice;//购物总价格
@property (strong, nonatomic) NSMutableDictionary *numDic;//每件商品的个数dic


@property (nonatomic, strong) XWInteractiveTransition *interactivePush;
@end
static NSString *const cellID = @"ShoppingCartViewCell";
@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewWithTitle:@"购物车"];
    [self initTableView];
    [self initInteractiveTransition];
    // Do any additional setup after loading the view.
}
- (void)initTableView{
    if (self.shopBuys) {
        [self.shopBuys removeAllObjects];
    }
    ShoppingModel *model = [[ShoppingModel alloc] init];
    model.imageUrl = @"http://xqproduct.xiangqu.com/FsMd6kTVFnqL5qhupgNeYu4veM39?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x800/";
    model.title = @"短袖";
    model.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model.price = @"1.00";
    model.maxnum = @"10";
    model.color = @"蓝色";
    model.size = @"S";
    model.num = 1;
    [self.shopBuys addObject:model];
    
    ShoppingModel *model1 = [[ShoppingModel alloc] init];
    model1.imageUrl = @"http://xqproduct.xiangqu.com/FkKSh-s49Lh767u9bDMCIUF4mIDJ?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/2500x1667/";
    model1.title = @"短袖";
    model1.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model1.price = @"10.00";
    model1.color = @"蓝色";
    model1.maxnum = @"5";
    model1.size = @"S";
    model1.num = 1;
    [self.shopBuys addObject:model1];
    
    ShoppingModel *model2 = [[ShoppingModel alloc] init];
    model2.imageUrl = @"http://xqproduct.xiangqu.com/FnR4RLXJjxLLWk4wvHC4WP5W_M4_?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x800/";
    model2.title = @"短袖";
    model2.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model2.price = @"100.00";
    model2.color = @"蓝色";
    model2.maxnum = @"15";
    model2.size = @"S";
    model2.num = 1;
    [self.shopBuys addObject:model2];
    
    
    ShoppingModel *model3 = [[ShoppingModel alloc] init];
    model3.imageUrl = @"http://xqproduct.xiangqu.com/Fmsvn7L8TJ_m9RFgqyJHT40MZmVE?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/900x900/";
    model3.title = @"短袖";
    model3.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model3.price = @"10.00";
    model3.color = @"蓝色";
    model3.maxnum = @"3";
    model3.size = @"S";
    model3.num = 1;
    [self.shopBuys addObject:model3];
    
    ShoppingModel *model4 = [[ShoppingModel alloc] init];
    model4.imageUrl = @"http://xqproduct.xiangqu.com/Fmsvn7L8TJ_m9RFgqyJHT40MZmVE?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/900x900/";
    model4.title = @"短袖";
    model4.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model4.price = @"100.00";
    model4.color = @"蓝色";
    model4.maxnum = @"3";
    model4.size = @"S";
    model4.num = 1;
    [self.shopBuys addObject:model4];
    
    ShoppingModel *model5 = [[ShoppingModel alloc] init];
    model5.imageUrl = @"http://xqproduct.xiangqu.com/Fmsvn7L8TJ_m9RFgqyJHT40MZmVE?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/900x900/";
    model5.title = @"短袖";
    model5.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model5.price = @"1000.00";
    model5.color = @"蓝色";
    model5.maxnum = @"3";
    model5.size = @"S";
    model5.num = 1;
    [self.shopBuys addObject:model5];
    
    ShoppingModel *model6 = [[ShoppingModel alloc] init];
    model6.imageUrl = @"http://xqproduct.xiangqu.com/Fmsvn7L8TJ_m9RFgqyJHT40MZmVE?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/900x900/";
    model6.title = @"短袖";
    model6.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model6.price = @"10000.00";
    model6.color = @"蓝色";
    model6.maxnum = @"3";
    model6.size = @"S";
    model6.num = 1;
    [self.shopBuys addObject:model6];
    
    [self.shopTableView reloadData];
    if ([self.shopBuys count] > 0) {
        [self initToolView];
    }
}
- (void)initToolView{
    [self.toolView setValueWithPrice:@"0.00"];
}
#pragma mark --lazyload
- (ShopToolView *)toolView{
    if (!_toolView) {
        _toolView = [[ShopToolView alloc] init];
        _toolView.frame = CGRectMake(0, HEIGHT - kBottomBarHeight - TOOLVIEW_H, WIDTH, TOOLVIEW_H);
        if (self.isPush) {
            _toolView.frame = CGRectMake(0, HEIGHT - TOOLVIEW_H, WIDTH, TOOLVIEW_H);
        }
        _toolView.delegate = self;
        [self.view addSubview:_toolView];
    }
    return _toolView;
}
- (UITableView *)shopTableView{
    if (!_shopTableView) {
        _shopTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - TOOLVIEW_H) style:UITableViewStyleGrouped];
        _shopTableView.showsVerticalScrollIndicator = NO;
        _shopTableView.showsHorizontalScrollIndicator = NO;
        _shopTableView.backgroundColor = [UIColor clearColor];
        _shopTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _shopTableView.delegate = self;
        _shopTableView.dataSource = self;
        [PinMethod addMjRefreshWithTableView:_shopTableView Target:self WithSelector:@selector(refreshData:) WithSelector:@selector(refreshMoreData:)];
        [self.view addSubview:_shopTableView];
    }
    return _shopTableView;
}
- (NSMutableArray *)shopBuys{
    if (!_shopBuys) {
        _shopBuys =[[NSMutableArray alloc] init];
    }
    return _shopBuys;
}
- (NSMutableArray *)clearings{
    if (!_clearings) {
        _clearings = [[NSMutableArray alloc] init];
    }
    return _clearings;
}
- (NSMutableDictionary *)numDic{
    if (!_numDic) {
        _numDic = [[NSMutableDictionary alloc] init];
    }
    return _numDic;
}
#pragma mark
#pragma mark ——UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.shopBuys count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShopTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.tag = indexPath.row;
    cell.delegate = self;
    if (cell == nil) {
        cell = [[ShopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //赋值
    if (self.shopBuys &&[self.shopBuys count]> 0) {
        ShoppingModel *model = self.shopBuys[indexPath.row];
        model.index = indexPath.row;
        [cell setValueWithModel:model];
    }
    //设置背景色
    [cell setSelfColorSelected:NO];
    if ([self.clearings count] > 0) {
        [cell setSelfColorSelected:NO];
        for (ShoppingModel *model in self.clearings) {
            if (indexPath.row == model.index) {
               [cell setSelfColorSelected:YES];
            }
        }
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
    
//    ShopTableViewCell*cell = (ShopTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    float totalPrice = 0.00;
//    int num = [[self.numDic valueForKey:@"num"] intValue];
//    int tag = [[self.numDic valueForKey:@"tag"] intValue];

    if ([self.clearings containsObject:self.shopBuys[indexPath.row]]) {
        [self.clearings removeObject:self.shopBuys[indexPath.row]];
    }else{
        [self.clearings addObject:self.shopBuys[indexPath.row]];
    }
    [self.shopTableView reloadData];
    for (ShoppingModel *model in self.shopBuys) {
//        if (model.index == tag) {
//            model.num = num;
//        }
        NSLog(@"\nmodel.num = %d==========",model.num);
    }
    if ([self.clearings count] > 0) {
        for (ShoppingModel *model in self.clearings) {
            totalPrice = totalPrice +[model.price floatValue]*model.num;
        }
        NSLog(@"总价格--->%.f",totalPrice);
        [self.toolView setValueWithPrice:[NSString stringWithFormat:@"%.f",totalPrice]];
    }else{
        [self.toolView setValueWithPrice:@"0.00"];
    }
    
    
    
    
    

//    cell.selected ? [cell setSelfColorSelected:YES]:[cell setSelfColorSelected:NO];
//    GoodsViewController *good = [[GoodsViewController alloc] init];
//    good.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:good animated:YES];
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    ShopTableViewCell*cell = (ShopTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
//    [cell setSelfColorSelected:NO];
    
//    [self.clearings removeObject:self.shopBuys[indexPath.row]];
    
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
            [self.shopBuys removeObjectAtIndex:indexPath.row];
            [self.shopTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case UITableViewCellEditingStyleInsert:
//            [self.shopBuys removeObjectAtIndex:indexPath.row];
//            [self.shopTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case UITableViewCellEditingStyleNone:
//            [self.shopBuys removeObjectAtIndex:indexPath.row];
//            [self.shopTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            break;
    }
    
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
#pragma mark --ShopButtonClickDelegate
- (void)shopButtonClickNumString:(NSString *)numString ButtonTag:(NSInteger)buttonTag{
    NSLog(@"buy count--->%@--->%zi",numString,buttonTag);
    
    
    int num = [numString intValue];
    int tag = (int)buttonTag;
    float totalPrice = 0.00;
    
    for (ShoppingModel *model in self.shopBuys) {
        if (model.index == tag) {
            model.num = num;
            NSLog(@"model.num = %d==========tag=%d",model.num,tag);
        }
    }
    
    if ([self.clearings count] > 0) {
        for (ShoppingModel *model in self.clearings) {
            totalPrice = totalPrice +[model.price floatValue]*model.num;
        }
        NSLog(@"每次价格--->%.f",totalPrice);
        [self.toolView setValueWithPrice:[NSString stringWithFormat:@"%.f",totalPrice]];
    }else{
        [self.toolView setValueWithPrice:@"0.00"];
    }
    
    
    
}
#pragma mark --ShopToolViewBtnClickDelegate
- (void)ShopToolViewBtnClickIndex:(ShopToolViewBtnType)index Selected:(BOOL)selected{
    switch (index) {
        case ShopToolViewBtnTypeAllSelected:
            [self ShopToolViewBtnTypeAllSelected:selected];
            break;
        case ShopToolViewBtnTypeClearing:
            [self ShopToolViewBtnTypeClearing];
            break;
            
        default:
            break;
    }
}
- (void)ShopToolViewBtnTypeAllSelected:(BOOL )selected{
    //全
    NSLog(@"--->%@",selected?@"YES":@"NO");
    if ([self.clearings count] > 0) {
        [self.clearings removeAllObjects];
    }
    selected? self.clearings  = [self.shopBuys mutableCopy] :[self.clearings removeAllObjects];
    [self.shopTableView reloadData];
    
    
    float totalPrice = 0.0;
    if ([self.clearings count] > 0) {
        for (ShoppingModel *model in self.clearings) {
            totalPrice = totalPrice +[model.price floatValue]*model.num;
        }
        NSLog(@"每次价格--->%.f",totalPrice);
        [self.toolView setValueWithPrice:[NSString stringWithFormat:@"%.f",totalPrice]];
    }else{
        [self.toolView setValueWithPrice:@"0.00"];
    }
}
- (void)ShopToolViewBtnTypeClearing{
    //结算
    if ([self.clearings count] == 0) {
        [self showMessageTitle:@"请选择购买的商品"];
        return;
    }
    [self present];
}
#pragma mark --初始化自定义转场动画
- (void)initInteractiveTransition{
//    _interactivePush = [XWInteractiveTransition interactiveTransitionWithTransitionType:XWInteractiveTransitionTypePresent GestureDirection:nil];
//    typeof(self)weakSelf = self;
//    _interactivePush.presentConifg = ^(){
//        [weakSelf present];
//    };
//    [_interactivePush addPanGestureForViewController:self.navigationController];
}
- (void)present{
    PayForCartViewController *pay = [PayForCartViewController new];
    pay.delegate = self;
    pay.payGoods = [self.clearings copy];
    [self presentViewController:pay animated:YES completion:nil];
}

- (void)presentedPayForCartViewControllerDissmiss{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent{
    
    return _interactivePush;
}

#pragma mark --MJRefresh
- (void)refreshData:(MJRefreshNormalHeader *)header{
    
    [header endRefreshing];
}

- (void)refreshMoreData:(MJRefreshAutoNormalFooter *)footer{
    [footer endRefreshing];
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
