//
//  CollectViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/17.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define cellH 130
#import "CollectViewController.h"
#import "CollectTableViewCell.h"
#import "CollectModel.h"


@interface CollectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *collectTableView;
@property (strong, nonatomic) UIButton *rightBtn;

@property (strong, nonatomic) NSMutableArray *collects;
@property (strong, nonatomic) NSMutableArray *deletes;

@end

@implementation CollectViewController
static NSString *const cellID = @"CollectTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavgationBar];
    [self initCollectTableView];
}
- (void)initNavgationBar{
    [self addTitleViewWithTitle:@"我的收藏"];
   self.rightBtn = [self addRightBtnWithTitle:@"编辑" withImage:nil withTitleColor:[UIColor blackColor] withTarget:self withMethod:@selector(rightButtonClick:)];
}
- (void)rightButtonClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [self.collectTableView setEditing:YES animated:YES];
        [btn setTitle:@"完成" forState:UIControlStateNormal];
        
    }else{
        [self.collectTableView setEditing:NO animated:YES];
        [btn setTitle:@"编辑" forState:UIControlStateNormal];
    }
    NSLog(@"deletes= %@,collects= %@",self.deletes,self.collects);
    
    if ([self.collects count] > 0 &&[self.deletes count] > 0) {
        for (CollectModel *model in self.deletes) {
            [self.collects removeObject:model];
        }
    }
    [self.collectTableView reloadData];
}
- (void)initCollectTableView{
    if (self.collects) {
        [self.collects removeAllObjects];
    }
    
    CollectModel *model = [[CollectModel alloc] init];
    model.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model.title = @"短袖";
    model.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model.size = @"S";
    model.price = @"¥45.00";
    model.state = @"已收藏";
    [self.collects addObject:model];
    
    CollectModel *model1 = [[CollectModel alloc] init];
    model1.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model1.title = @"短袖";
    model1.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model1.size = @"S";
    model1.price = @"¥45.00";
    model1.state = @"已收藏";
    [self.collects addObject:model1];
    
    CollectModel *model2 = [[CollectModel alloc] init];
    model2.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model2.title = @"短袖";
    model2.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model2.size = @"S";
    model2.price = @"¥45.00";
    model2.state = @"已收藏";
    [self.collects addObject:model2];
    
    
    CollectModel *model3 = [[CollectModel alloc] init];
    model3.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model3.title = @"短袖";
    model3.desctitle = @"关系户最多帮拼允许5个帮拼最高金额3元自己应支付20元";
    model3.size = @"S";
    model3.price = @"¥45.00";
    model3.state = @"已收藏";
    [self.collects addObject:model3];
    [self.collectTableView reloadData];
}
- (UITableView *)collectTableView{
    if (!_collectTableView) {
        _collectTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
        _collectTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _collectTableView.backgroundColor = [UIColor clearColor];
        _collectTableView.rowHeight = cellH;
        _collectTableView.delegate = self;
        _collectTableView.dataSource = self;
        [_collectTableView registerNib:[UINib nibWithNibName:@"CollectTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellID];
        [self.view addSubview:_collectTableView];
    }
    return _collectTableView;
}
- (NSMutableArray *)collects{
    if (!_collects) {
        _collects = [[NSMutableArray alloc] init];
    }
    return _collects;
}
- (NSMutableArray *)deletes{
    if (!_deletes) {
        _deletes = [[NSMutableArray alloc] init];
    }
    return _deletes;
}
#pragma mark
#pragma mark ——UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.collects count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (self.collects &&[self.collects count]> 0) {
        CollectModel *model = self.collects[indexPath.row];
        [cell setValueWithModel:model];
    }
    
    return cell;
}
#pragma mark ——UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.rightBtn.selected) {
        NSLog(@"选中----%zi",indexPath.row);
        CollectModel *model = self.collects[indexPath.row];
        [self.deletes addObject:model];
        return;
    }
    
    GoodsViewController *good = [[GoodsViewController alloc] init];
    [self.navigationController pushViewController:good animated:YES];
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.rightBtn.selected) {
        CollectModel *model = self.collects[indexPath.row];
        [self.deletes removeObject:model];
        NSLog(@"移除----%zi",indexPath.row);
        return;
    }
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
//返回的是编辑样式(删除还是添加)
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
    
}
////点击编辑对cell进行删除处理
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (editingStyle==UITableViewCellEditingStyleDelete) {
////        [_dataArrary removeObjectAtIndex:indexPath.row];
//    }
//    [self.collectTableView reloadData];
//    
//}
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
