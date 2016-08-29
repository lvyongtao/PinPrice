//
//  OrderViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/17.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define cellH 130
#define SELECTED_HEIGHT 54
#import "OrderViewController.h"
#import "OrderModel.h"
#import "OrderTableViewCell.h"
#import "OrderSelectedView.h"
#import "QueryOrderViewController.h"

@interface OrderViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,OrderSelectedViewsegementedDelegate,OrderCellButtonDelegate>


@property (strong, nonatomic) UIScrollView *orderScrollView;
@property (strong, nonatomic) UITableView *willOrderTableView;
@property (strong, nonatomic) UITableView *didOrderTableView;
@property (strong, nonatomic) OrderSelectedView *selectedView;

@property (strong, nonatomic) NSMutableArray *orders;

@end

static NSString *const cellID = @"orderTableViewCell";
@implementation OrderViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavgationBar];
    [self initSelectedView];
    [self initwillOrderTableView];
    [self initdidOrderTableView];
}
#pragma mark --init
- (void)initNavgationBar{
    [self addTitleViewWithTitle:@"订单"];
}
- (void)initSelectedView{
    NSArray *titles = @[@"未完成订单",@"已完成订单"];
    self.selectedView.titles = titles;
}
- (void)initwillOrderTableView{
    if (self.orders) {
        [self.orders removeAllObjects];
    }
    OrderModel *model = [[OrderModel alloc] init];
    model.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model.title = @"品牌男装短袖";
    model.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model.brandtitle = @"品牌男装";
    model.price = @"¥45.00";
    model.num = @"数量: X 1";
    [self.orders addObject:model];
    
    OrderModel *model1 = [[OrderModel alloc] init];
    model1.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model1.title = @"品牌男装短袖";
    model1.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model1.brandtitle = @"品牌男装";
    model1.price = @"¥45.00";
    model1.num = @"数量: X 2";
    [self.orders addObject:model1];
    
    OrderModel *model2 = [[OrderModel alloc] init];
    model2.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model2.title = @"短袖";
    model2.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model2.brandtitle = @"品牌男装";
    model2.price = @"¥45.00";
    model2.num = @"数量: X 3";
    [self.orders addObject:model2];
    
    
    OrderModel *model3 = [[OrderModel alloc] init];
    model3.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model3.title = @"短袖";
    model3.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model3.brandtitle = @"品牌男装";
    model3.price = @"¥45.00";
    model3.num = @"数量: X 4";
    [self.orders addObject:model3];
    [self.willOrderTableView reloadData];
}

- (void)initdidOrderTableView{
    if (self.orders) {
        [self.orders removeAllObjects];
    }
    OrderModel *model = [[OrderModel alloc] init];
    model.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model.title = @"品牌男装短袖";
    model.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model.brandtitle = @"品牌男装";
    model.price = @"¥45.00";
    model.num = @"数量: X 5";
    [self.orders addObject:model];
    
    OrderModel *model1 = [[OrderModel alloc] init];
    model1.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model1.title = @"品牌男装短袖";
    model1.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model1.brandtitle = @"品牌男装";
    model1.price = @"¥45.00";
    model1.num = @"数量: X 6";
    [self.orders addObject:model1];
    
    OrderModel *model2 = [[OrderModel alloc] init];
    model2.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model2.title = @"短袖";
    model2.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model2.brandtitle = @"品牌男装";
    model2.price = @"¥45.00";
    model2.num = @"数量: X 7";
    [self.orders addObject:model2];
    
    
    OrderModel *model3 = [[OrderModel alloc] init];
    model3.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model3.title = @"短袖";
    model3.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model3.brandtitle = @"品牌男装";
    model3.price = @"¥45.00";
    model3.num = @"数量: X 8";
    [self.orders addObject:model3];
    
    OrderModel *model4 = [[OrderModel alloc] init];
    model4.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model4.title = @"短袖";
    model4.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model4.brandtitle = @"品牌男装";
    model4.price = @"¥45.00";
    model4.num = @"数量: X 8";
    [self.orders addObject:model4];
    
    OrderModel *model5 = [[OrderModel alloc] init];
    model5.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model5.title = @"短袖";
    model5.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model5.brandtitle = @"品牌男装";
    model5.price = @"¥45.00";
    model5.num = @"数量: X 8";
    [self.orders addObject:model5];
    
    OrderModel *model6 = [[OrderModel alloc] init];
    model6.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model6.title = @"短袖";
    model6.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model6.brandtitle = @"品牌男装";
    model6.price = @"¥45.00";
    model6.num = @"数量: X 8";
    [self.orders addObject:model6];
    [self.didOrderTableView reloadData];
}
#pragma mark --lazyload
- (NSMutableArray *)orders{
    if (!_orders) {
        _orders = [[NSMutableArray alloc] init];
    }
    return _orders;
}
- (UITableView *)willOrderTableView{
    if (!_willOrderTableView) {
        _willOrderTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - SELECTED_HEIGHT - NavH) style:UITableViewStyleGrouped];
        _willOrderTableView.backgroundColor = [UIColor clearColor];
        _willOrderTableView.rowHeight = cellH;
        _willOrderTableView.delegate = self;
        _willOrderTableView.dataSource = self;
        _willOrderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_willOrderTableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellID];
        [PinMethod addMjRefreshWithTableView:_willOrderTableView Target:self WithSelector:@selector(refreshData:) WithSelector:@selector(refreshMoreData:)];
        [self.orderScrollView addSubview:_willOrderTableView];
    }
    return _willOrderTableView;
}
- (UITableView *)didOrderTableView{
    if (!_didOrderTableView) {
        _didOrderTableView = [[UITableView alloc] initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT - SELECTED_HEIGHT - NavH) style:UITableViewStyleGrouped];
        _didOrderTableView.backgroundColor = [UIColor clearColor];
        _didOrderTableView.rowHeight = cellH + 30;
        _didOrderTableView.delegate = self;
        _didOrderTableView.dataSource = self;
        _didOrderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_didOrderTableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellID];
        [PinMethod addMjRefreshWithTableView:_didOrderTableView Target:self WithSelector:@selector(refreshData:) WithSelector:@selector(refreshMoreData:)];
        [self.orderScrollView addSubview:_didOrderTableView];
    }
    return _didOrderTableView;
}
- (OrderSelectedView *)selectedView{
    if (!_selectedView) {
        _selectedView = [[OrderSelectedView alloc] init];
        _selectedView.frame = CGRectMake(0, NavH, WIDTH, SELECTED_HEIGHT);
        _selectedView.delegate = self;
        [self.view addSubview:_selectedView];
    }
    return _selectedView;
}
- (UIScrollView *)orderScrollView{
    if (!_orderScrollView) {
        _orderScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,NavH +SELECTED_HEIGHT, WIDTH, HEIGHT - SELECTED_HEIGHT - NavH)];
        _orderScrollView.delegate=self;
        _orderScrollView.showsHorizontalScrollIndicator=NO;
        _orderScrollView.backgroundColor = [UIColor clearColor];
        _orderScrollView.showsVerticalScrollIndicator=NO;
        _orderScrollView.bounces = NO;
        _orderScrollView.pagingEnabled=YES;
        _orderScrollView.contentSize=CGSizeMake(WIDTH*2, 0);
        [self.view addSubview:_orderScrollView];
 
    }
    return _orderScrollView;
}
#pragma mark --UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return [self.orders count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     OrderTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (tableView == _willOrderTableView) {
        cell.logisticsBtn.hidden = YES;
    }else{
        cell.logisticsBtn.hidden = NO;
    }
    if (self.orders &&[self.orders count]> 0) {
        cell.tag = indexPath.row;
        cell.delegate = self;
        OrderModel *model = self.orders[indexPath.row];
        [cell setValueWithModel:model];
    }
    return cell;
    
}
#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodsViewController *good = [[GoodsViewController alloc] init];
    [self.navigationController pushViewController:good animated:YES];
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
#pragma mark --OrderSelectedViewsegementedDelegate
- (void)OrderSelectedViewsegementedEventValueChanged:(NSInteger)index{
    NSLog(@"segemented----->%zi",index);
    [self AnimationScrollViewWith:index];
    switch (index) {
        case 0:
            [self initwillOrderTableView];
            break;
        case 1:
            [self initdidOrderTableView];
            break;
            
        default:
            break;
    }
    
}
#pragma mark --OrderCellButtonDelegate
- (void)OrderTableViewCellDeleteButtonDelegate:(NSInteger)index{
    [self.orders removeObjectAtIndex:index];
    if (self.selectedView.segemented.selectedSegmentIndex == 0) {
        
        [self.willOrderTableView reloadData];
    }else{
        [self.didOrderTableView reloadData];
    }
    NSLog(@"DeleteCell----->%zi",index);
}
- (void)OrderTableViewCelllogisticsButtonDelegate:(NSInteger)index{
    NSLog(@"logisticscell ----->%zi",index);
    QueryOrderViewController *query = [[QueryOrderViewController alloc] init];
    [self.navigationController pushViewController:query animated:YES];
}

#pragma mark --UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    float offsetX = self.orderScrollView.contentOffset.x;
    
    
    if (scrollView == self.orderScrollView) {
        if (offsetX >= WIDTH  && WIDTH*2 > offsetX) {
            [self initdidOrderTableView];
            self.selectedView.segemented.selectedSegmentIndex = 1;
        }else{
            [self initwillOrderTableView];
            self.selectedView.segemented.selectedSegmentIndex = 0;
        }
    }
}
- (void)AnimationScrollViewWith:(NSInteger )index{
    if (index == 0) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5f];
        self.orderScrollView.contentOffset=CGPointMake(0, 0);
        [UIView commitAnimations];
    }else{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5f];
        self.orderScrollView.contentOffset=CGPointMake(WIDTH, 0);
        [UIView commitAnimations];
    }
    
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
