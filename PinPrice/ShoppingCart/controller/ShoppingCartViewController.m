//
//  ShoppingCartViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/8.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define cellH 150
#import "ShoppingCartViewController.h"
#import "ShopTableViewCell.h"
#import "ShoppingModel.h"

@interface ShoppingCartViewController ()<UITableViewDelegate,UITableViewDataSource,ShopButtonClickDelegate>

@property (strong, nonatomic) UITableView *shopTableView;

@property (strong, nonatomic) NSMutableArray *shopBuys;

@end
static NSString *cellID = @"ShoppingCartViewCell";
@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewWithTitle:@"购物车"];
    [self initTableView];
//    [self initToolbar];
   
    // Do any additional setup after loading the view.
}
- (void)initTableView{
    if (self.shopBuys) {
        [self.shopBuys removeAllObjects];
    }
    ShoppingModel *model = [[ShoppingModel alloc] init];
    model.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model.title = @"短袖";
    model.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model.price = @"¥105.00";
    model.maxnum = @"10";
    model.color = @"蓝色";
    [self.shopBuys addObject:model];
    
    ShoppingModel *model1 = [[ShoppingModel alloc] init];
    model1.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model1.title = @"短袖";
    model1.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model1.price = @"¥45.00";
    model1.color = @"蓝色";
    model1.maxnum = @"5";
    [self.shopBuys addObject:model1];
    
    ShoppingModel *model2 = [[ShoppingModel alloc] init];
    model2.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model2.title = @"短袖";
    model2.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model2.price = @"¥999.00";
    model2.color = @"蓝色";
    model2.maxnum = @"15";
    [self.shopBuys addObject:model2];
    
    
    ShoppingModel *model3 = [[ShoppingModel alloc] init];
    model3.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model3.title = @"短袖";
    model3.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model3.price = @"¥45.00";
    model3.color = @"蓝色";
    model3.maxnum = @"3";
    [self.shopBuys addObject:model3];
    [self.shopTableView reloadData];
}
- (void)initToolbar{
     [self.navigationController setToolbarHidden:NO animated:NO];
    [self.navigationController.toolbar setTranslucent:NO];
    [self.navigationController.toolbar setTintColor:[UIColor whiteColor]];
    [self.navigationController.toolbar setBarTintColor:[UIColor whiteColor]];
}
#pragma mark --lazyload
- (UITableView *)shopTableView{
    if (!_shopTableView) {
        _shopTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - kBottomBarHeight*2) style:UITableViewStyleGrouped];
        _shopTableView.showsVerticalScrollIndicator = NO;
        _shopTableView.showsHorizontalScrollIndicator = NO;
        _shopTableView.backgroundColor = [UIColor clearColor];
        _shopTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _shopTableView.delegate = self;
        _shopTableView.dataSource = self;
        [self.view addSubview:_shopTableView];
    }
    return _shopTableView;
}
- (NSMutableArray *)shopBuys{
    if (!_shopBuys) {
        _shopBuys =[NSMutableArray arrayWithCapacity:0];
    }
    return _shopBuys;
}
#pragma mark
#pragma mark ——UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.shopBuys count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShopTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[ShopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.tag = indexPath.row;
        cell.delegate = self;

    }
    if (self.shopBuys &&[self.shopBuys count]> 0) {
        ShoppingModel *model = self.shopBuys[indexPath.row];
        [cell setValueWithModel:model];
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
- (void)shopButtonClickNumString:(NSString *)numString ButtonTag:(NSInteger)buttonTag{
    
     NSLog(@"buy count--->%@--->%zi",numString,buttonTag);
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
