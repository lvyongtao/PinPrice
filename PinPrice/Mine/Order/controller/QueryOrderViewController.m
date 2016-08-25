//
//  QueryOrderViewController.m
//  Pintime
//
//  Created by lvyongtao on 16/8/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define cellH 94
#define HEADVIEW_HEIGHT 72
#import "QueryOrderViewController.h"
#import "QueryOrderModel.h"
#import "QueryTableViewCell.h"
#import "QueryheadView.h"
//0.107
@interface QueryOrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *queryTableView;
@property (strong, nonatomic) QueryheadView *headView;

@property (strong, nonatomic) NSMutableArray *queryOrders;

@end
static NSString *const cellID = @"QueryTableViewCell";
@implementation QueryOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavgationBar];
    [self initqueryTableView];
}
- (void)initNavgationBar{
    [self addTitleViewWithTitle:@"订单查询"];
}
- (void)initqueryTableView{
    if (self.queryOrders) {
        [self.queryOrders removeAllObjects];
    }
    QueryOrderModel *model = [[QueryOrderModel alloc] init];
    model.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model.express = @"顺丰速递";
    model.orderid = @"123435345123123";
    model.address = @"[北京市]，郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区郑州市金水区";
    model.time = @"2016-06-01 10:20:00";
    [self.queryOrders addObject:model];
    
    QueryOrderModel *model1 = [[QueryOrderModel alloc] init];
    model1.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model1.express = @"快递公司：顺丰速递";
    model1.orderid = @"运单编号：123435345123123";
    model1.address = @"[商丘市]，郑州市金水区郑州市金水区郑州市金水区郑州市金水区";
    model1.time = @"2016-06-01 10:20:00";
    [self.queryOrders addObject:model1];
    
    QueryOrderModel *model2 = [[QueryOrderModel alloc] init];
    model2.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model2.express = @"顺丰速递";
    model2.orderid = @"123435345123123";
    model2.address = @"[郑州市]，郑州市金水区郑州市金水区郑州市金水区郑州市金水区";
    model2.time = @"2016-06-01 10:20:00";
    [self.queryOrders addObject:model2];
    
    
    QueryOrderModel *model3 = [[QueryOrderModel alloc] init];
    model3.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model3.express = @"顺丰速递";
    model3.orderid = @"123435345123123";
    model3.address = @"[河北市]，郑州市金水区郑州市金水区郑州市金水区郑州市金水区";
    model3.time = @"2016-06-01 10:20:00";
    [self.queryOrders addObject:model3];
    [self.queryTableView reloadData];
}

- (UITableView *)queryTableView{
    if (!_queryTableView) {
        _queryTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
        _queryTableView.backgroundColor = [UIColor clearColor];
        _queryTableView.estimatedRowHeight = cellH;
        _queryTableView.delegate = self;
        _queryTableView.dataSource = self;
        _queryTableView.tableHeaderView = [self tableHeaderView];
//        _queryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_queryTableView registerNib:[UINib nibWithNibName:@"QueryTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellID];
        
        [self.view addSubview:_queryTableView];
    }
    return _queryTableView;
}
- (UIView *)tableHeaderView{
    
    
    _headView = [[QueryheadView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEADVIEW_HEIGHT)];
    _headView.backgroundColor = [UIColor grayColor];
    if ([self.queryOrders count] > 0) {
        QueryOrderModel *model = self.queryOrders[0];
        _headView.iconUrl =model.imageUrl;
        _headView.expresstext = [NSString stringWithFormat:@"快递公司：%@",model.express];
        _headView.orderIDtext = [NSString stringWithFormat:@"运单编号：%@",model.orderid];
    }
    return _headView;
}
- (NSMutableArray *)queryOrders{
    if (!_queryOrders) {
        _queryOrders = [[NSMutableArray alloc] init];
    }
    return _queryOrders;
}

#pragma mark --UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.queryOrders count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QueryTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (self.queryOrders &&[self.queryOrders count]> 0) {
        cell.fd_enforceFrameLayout = NO;
        cell.queryModel = self.queryOrders[indexPath.row];
    }
    return cell;
    
}
#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:cellID cacheByIndexPath:indexPath configuration:^(QueryTableViewCell *cell) {
        cell.fd_enforceFrameLayout = NO;
        cell.queryModel = self.queryOrders[indexPath.row];
    }];
}
//设置section的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:( NSInteger)section{
    if (section == 0) {
        return 15.0;
    }
    return 20.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1.0;
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
