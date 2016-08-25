//
//  AddressViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/17.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define cellH 100
#define BTN_H 50
#import "AddressViewController.h"
#import "AddressTableViewCell.h"
#import "AddressModel.h"
#import "NewAddressViewController.h"

@interface AddressViewController ()<UITableViewDelegate,UITableViewDataSource,AddressTableViewBtnDelegate>
@property (strong, nonatomic) UITableView *addressTableView;
@property (strong, nonatomic) UIButton *addAddressBtn;

@property (strong, nonatomic) NSMutableArray *addressArr;
@property (strong, nonatomic) NSMutableArray *deletes;
@end
static NSString *const cellID = @"AddressTableViewCell";
@implementation AddressViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavgationBar];
    [self initAddressTableView];
}
- (void)initNavgationBar{
    [self addTitleViewWithTitle:@"地址管理"];
    [self addRightBtnWithTitle:@"编辑" withImage:nil withTitleColor:[UIColor blackColor] withTarget:self withMethod:@selector(rightButtonClick)];
    [self.addAddressBtn setTintColor:[UIColor clearColor]];
}
- (void)rightButtonClick{
    
}
- (void)initAddressTableView{
    if (self.addressArr) {
        [self.addressArr removeAllObjects];
    }
    
    AddressModel *model = [[AddressModel alloc] init];
    model.name = @"taoaim0";
    model.address = @"北京市朝阳区";
    model.detailaddress = @"来广营北纬40度幸福家园三层3318室";
    model.phone = @"18272917285";
    [self.addressArr addObject:model];
    
    AddressModel *model1 = [[AddressModel alloc] init];
    model1.name = @"taoaim1";
    model1.address = @"北京市朝阳区";
    model1.detailaddress = @"来广营北纬40度幸福家园三层3318室01";
    model1.phone = @"18272917285";
    [self.addressArr addObject:model1];
    
    AddressModel *model2 = [[AddressModel alloc] init];
    model2.name = @"taoaim2";
    model2.address = @"河南省郑州市";
    model2.detailaddress = @"来广营北纬40度幸福家园三层3318室02";
    model2.phone = @"18272917285";
    [self.addressArr addObject:model2];
    
    
    AddressModel *model3 = [[AddressModel alloc] init];
    model3.name = @"taoaim3";
    model3.address = @"河南省郑州市";
    model3.detailaddress = @"来广营北纬40度幸福家园三层3318室03";
    model3.phone = @"18272917285";
    [self.addressArr addObject:model3];
    
    [self.addressTableView reloadData];
}
#pragma mark --lazyload
- (NSMutableArray *)addressArr{
    if (!_addressArr) {
        _addressArr =[[NSMutableArray alloc] init];
    }
    return _addressArr;
}
- (UITableView *)addressTableView{
    if (!_addressTableView) {
        _addressTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NavH, WIDTH, HEIGHT - BTN_H - NavH) style:UITableViewStyleGrouped];
        _addressTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _addressTableView.backgroundColor = [UIColor clearColor];
        _addressTableView.rowHeight = cellH;
        _addressTableView.delegate = self;
        _addressTableView.dataSource = self;
        [_addressTableView registerNib:[UINib nibWithNibName:@"AddressTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellID];
        [self.view addSubview:_addressTableView];
    }
    return _addressTableView;
}
- (UIButton *)addAddressBtn{
    if (!_addAddressBtn) {
        _addAddressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addAddressBtn.backgroundColor = [UIColor grayColor];
        _addAddressBtn.frame = CGRectMake(0, HEIGHT - BTN_H, WIDTH, BTN_H);
        [_addAddressBtn setTitle:@"新增地址" forState:UIControlStateNormal];
        _addAddressBtn.userInteractionEnabled = YES;
        [_addAddressBtn addTarget:self action:@selector(addAddressBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_addAddressBtn];
    }
    return _addAddressBtn;
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
    return [self.addressArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddressTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.delegate = self;
    cell.tag = indexPath.row;
    if (self.addressArr &&[self.addressArr count]> 0) {
        cell.model = self.addressArr[indexPath.row];
    }
    
    return cell;
}
#pragma mark ——UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddressModel *model = self.addressArr[indexPath.row];
    if (self.addressBlock) {
        self.addressBlock(model);
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//设置section的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:( NSInteger)section{
    if (section == 0) {
        return 20.0;
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


#pragma mark --action

- (void)AddressTableViewBtnClick:(NSInteger)btntag Tag:(NSInteger)index{
    switch (btntag) {
        case AddressTableViewBtnTypeDefault:
            [self actionTableViewBtnTypeDefaultTag:index];
            break;
        case AddressTableViewBtnTypeEditing:
            [self actionTableViewBtnTypeEditingTag:index];
            break;
        case AddressTableViewBtnTypeDelete:
            [self actionTableViewBtnTypeDeleteTag:index];
            break;
            
        default:
            break;
    }
    NSLog(@"点击的类型---->%zi",btntag);
}
- (void)actionTableViewBtnTypeDefaultTag:(NSInteger )index{
    AddressModel *model = self.addressArr[index];
    [self.addressArr removeObjectAtIndex:index];
    [self.addressArr insertObject:model atIndex:0];

    [self.addressTableView reloadData];
    NSLog(@"设置默认地址");
}
- (void)actionTableViewBtnTypeEditingTag:(NSInteger )index{
    NewAddressViewController *new = [[NewAddressViewController alloc] init];
    new.model = self.addressArr[index];
    [new returnAddressViewController:^(AddressModel *model) {
        self.addressArr[index] = model;
        [self.addressTableView reloadData];
    }];
    [self.navigationController pushViewController:new animated:YES];
    NSLog(@"编辑地址");
}
- (void)actionTableViewBtnTypeDeleteTag:(NSInteger )index{
    [self.deletes addObject:self.addressArr[index]];
    if ([self.addressArr count] > 0 &&[self.addressArr count] > 0) {
        for (AddressModel *model in self.deletes) {
            [self.addressArr removeObject:model];
        }
    }
    [self.addressTableView reloadData];
    NSLog(@"删除地址");
}



- (void)addAddressBtnClick:(UIButton *)btn{
    NewAddressViewController *new = [[NewAddressViewController alloc] init];
    [new returnAddressViewController:^(AddressModel *model) {
        [self.addressArr addObject:model];
        [self.addressTableView reloadData];
    }];
    [self.navigationController pushViewController:new animated:YES];
    NSLog(@"新增地址");
}
- (void)returnBuyGoodsViewController:(AddressBuyBlock)block{
    _addressBlock = block;
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
