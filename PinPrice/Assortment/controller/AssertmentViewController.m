//
//  AssertmentViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/8.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//


#define TIMECELL_HEIGHT 40
#define MINLINESPACEING 5

#define CELL_NUM 32
#define LINESPACE_Y 5



#import "AssertmentViewController.h"
#import "TypeCollectionViewCell.h"
#import "AssertmentModel.h"
#import "SortViewController.h"

@interface AssertmentViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *typeColletionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *typeLayout;

@property (strong, nonatomic) NSMutableArray *types;

@end
static NSString *cellID = @"typeColletionViewCellID";
@implementation AssertmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initdate];
    [self initCollectionView];
   
}

- (void)initdate{
    [self addTitleViewWithTitle:@"分类"];
}
- (void)initCollectionView{
    if (self.types) {
        [self.types removeAllObjects];
    }
    AssertmentModel *model = [[AssertmentModel alloc] init];
    model.imageUrl = @"http://xqproduct.xiangqu.com/FgUXjl4jUd7dfeiylxjmnfU0vABV?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x800/";
    model.name = @"潮流女装1";
    [self.types addObject:model];
    
    AssertmentModel *model1 = [[AssertmentModel alloc] init];
    model1.imageUrl = @"http://xqproduct.xiangqu.com/FogshFiq0lOFXGkj_hKHBUUVVvZW?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/650x650/";
    model1.name = @"潮流女装2";
    [self.types addObject:model1];
    
    AssertmentModel *model2 = [[AssertmentModel alloc] init];
    model2.imageUrl = @"http://xqproduct.xiangqu.com/FmNdIKHYerYg6jzW1OYzdhhWgqTr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/900x900/";
    model2.name = @"潮流女装3";
    [self.types addObject:model2];
    
    AssertmentModel *model3 = [[AssertmentModel alloc] init];
    model3.imageUrl = @"http://xqproduct.xiangqu.com/FnHGHyoDQC0xX8XhSLmB7tPx4lQk?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x750/";
    model3.name = @"潮流女装4";
    [self.types addObject:model3];
    
    AssertmentModel *model4 = [[AssertmentModel alloc] init];
    model4.imageUrl = @"http://xqproduct.xiangqu.com/FmT4d_Yurwpqu_8sfOEoVDW0Smik?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/900x900/";
    model4.name = @"潮流女装5";
    [self.types addObject:model4];
    [self.typeColletionView reloadData];
    
}
- (UICollectionView *)typeColletionView{
    if (!_typeColletionView) {
        _typeLayout = [[UICollectionViewFlowLayout alloc] init];
        [_typeLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _typeLayout.itemSize = CGSizeMake(WIDTH/3, WIDTH/3 +36);
        _typeLayout.minimumLineSpacing = 0;
        _typeLayout.minimumInteritemSpacing = 0;
        _typeColletionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH - MINLINESPACEING,HEIGHT) collectionViewLayout:_typeLayout];
        _typeColletionView.backgroundColor = [UIColor clearColor];
        _typeColletionView.delegate = self;
        _typeColletionView.dataSource = self;
        _typeColletionView.showsVerticalScrollIndicator = NO;
        _typeColletionView.showsHorizontalScrollIndicator = NO;
        [_typeColletionView registerNib:[UINib nibWithNibName:@"TypeCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellID];
        [self.view addSubview:_typeColletionView];
    }
    return _typeColletionView;
}
- (NSMutableArray *)types{
    if (!_types) {
        _types = [[NSMutableArray alloc] init];
    }
    return _types;
}
#pragma mark --UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.types count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TypeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    if (!cell) {}
    if (self.types && [self.types count] > 0) {
        AssertmentModel *model = self.types[indexPath.row];
        [cell setValueWithModel:model];
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0,0,- MINLINESPACEING);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    TypeCollectionViewCell *cell = (TypeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
    SortViewController *sort = [[SortViewController alloc] init];
    sort.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sort animated:YES];
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TypeCollectionViewCell *cell = (TypeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    
    
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
