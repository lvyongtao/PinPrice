//
//  MineViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/8.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define cellH 44

#import "MineViewController.h"
#import "MineHeadView.h"
#import "CollectViewController.h"
#import "OrderViewController.h"
#import "AddressViewController.h"
#import "SettingViewController.h"


@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *myTableView;

@property (strong, nonatomic) MineHeadView *headView;

@property (strong, nonatomic) NSArray *titles;

@end
static NSString *cellID = @"MineViewControllerCell";
@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initTableView];
    [self initdate];
    
}
- (void)initdate{
    [self addTitleViewWithTitle:@"我的"];
    [self addRightBtnWithTitle:@"设置" withImage:[UIImage imageNamed:@""] withTitleColor:[UIColor blackColor] withTarget:self withMethod:@selector(rightButtonClick)];
    _titles = [NSArray arrayWithObjects:@"我的收藏",@"我的订单",@"地址管理", nil];
}


- (void)initTableView{
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - kBottomBarHeight) style:UITableViewStyleGrouped];
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _myTableView.tableHeaderView = [self tableheadView];
    _myTableView.backgroundColor = [UIColor clearColor];
    _myTableView.rowHeight = 0.1*HEIGHT;
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];

}

- (UIView *)tableheadView{
    _headView = [[MineHeadView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 0.25*HEIGHT)];
    _headView.nametext = @"aaaaa";
    _headView.iconUrl = @"123";
    _headView.backgroundColor = [UIColor clearColor];
    return _headView;
}
#pragma mark
#pragma mark ——UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}
#pragma mark ——UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *className = [NSArray arrayWithObjects:@"CollectViewController",@"OrderViewController",@"AddressViewController", nil];
    Class class = NSClassFromString(className[indexPath.row]);
        RootViewController *root = [[class alloc] init];
    root.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:root animated:YES];
}
- (void)rightButtonClick{
    SettingViewController *setting = [[SettingViewController alloc] init];
    setting.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setting animated:YES];
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
