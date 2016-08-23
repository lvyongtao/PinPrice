//
//  GoodsViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
//#define TIMECELL_HEIGHT 40
//#define MINLINESPACEING 5
#define MINLINESPACEING_RELATED 15


//#define CELL_NUM 32
//#define LINESPACE_Y 5

#import "GoodsViewController.h"
#import "GoodDetaiView.h"
#import "GoodsCollectionViewCell.h"


@interface GoodsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,GoodDetaiViewBtnActionDelegate>
@property (strong, nonatomic) UIButton *rightBtn;
@property (strong, nonatomic) GoodDetaiView *detailView;
@property (strong, nonatomic) UICollectionView *goodColletionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *goodLayout;
@property (strong, nonatomic) UICollectionReusableView *headerView;

// 全部列表数组
@property (nonatomic, strong) NSMutableArray *goods;

@end
static NSString *const cellID = @"goodColletionViewCellID";
static NSString *const headerID = @"goodColletionViewCellheaderID";
@implementation GoodsViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavgationBar];
    [self initgoodColletionView];
}
#pragma mark --init
- (void)initNavgationBar{
    [self addTitleViewWithTitle:@"商品"];
//    [self addRightBtnsWithTitle1:@"收藏1" WithTitle2:@"收藏2" withImage:nil withTitleColor:[UIColor blackColor] withTarget:self withMethod:@selector(rightButtonClick:)];
    self.model = [[DetailGoodsModel alloc] init];
    self.model.imageUrl = @"http://xqproduct.xiangqu.com/FrGW-ZP5wTyOygFKx4w9CgNF1HWy?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x891/";
        self.model.goodsname = @"外星人T恤";
        self.model.goodsprice = @"¥45555.00";
}
- (void)rightButtonClick:(UIButton *)btn{
    
}
- (void)initgoodColletionView{
    
    [self.goodColletionView reloadData];
    
}

#pragma mark --requsetData
- (void)requsetData{
    if (self.goods) {
        [self.goods removeAllObjects];
    }
    RelatedGoodsListModel *model = [[RelatedGoodsListModel alloc] init];
    model.imageUrl = @"http://xqproduct.xiangqu.com/FrGW-ZP5wTyOygFKx4w9CgNF1HWy?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x891/";
    model.name = @"外星人T恤";
    model.price = @"¥45.00";
    [self.goods addObject:model];
    
    RelatedGoodsListModel *model1 = [[RelatedGoodsListModel alloc] init];
    model1.imageUrl = @"http://xqproduct.xiangqu.com/FkdKQqRGkXvToO9Wr3P4g7SF8-JN?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/700x700/";
    model1.name = @"外星人T恤1";
    model1.price = @"¥45.00";
    [self.goods addObject:model1];
    
    RelatedGoodsListModel *model2 = [[RelatedGoodsListModel alloc] init];
    model2.imageUrl = @"http://xqproduct.xiangqu.com/Fku8nFowE8o6Q5KgIZ3Oa083riHo?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/460x460/";
    model2.name = @"外星人T恤2";
    model2.price = @"¥45.00";
    [self.goods addObject:model2];
    
    RelatedGoodsListModel *model3 = [[RelatedGoodsListModel alloc] init];
    model3.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model3.name = @"外星人T恤3";
    model3.price = @"¥45.00";
    [self.goods addObject:model3];
    
    RelatedGoodsListModel *model4 = [[RelatedGoodsListModel alloc] init];
    model4.imageUrl = @"http://xqproduct.xiangqu.com/Fjh9tUJKPi56PDopd5rnGnEd90Um?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x800/";;
    model4.name = @"外星人T恤4";
    model4.price = @"¥45.00";
    [self.goods addObject:model4];
    
    RelatedGoodsListModel *model5 = [[RelatedGoodsListModel alloc] init];
    model5.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model5.name = @"外星人T恤5";
    model5.price = @"¥45.00";
    [self.goods addObject:model5];
    
    RelatedGoodsListModel *model6 = [[RelatedGoodsListModel alloc] init];
    model6.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model6.name = @"外星人T恤6";
    model6.price = @"¥45.00";
    [self.goods addObject:model6];
    
    
    [self.goodColletionView reloadData];
}
#pragma mark --lazyload
- (GoodDetaiView *)detailView{
    if (!_detailView) {
        _detailView = [[GoodDetaiView alloc] init];
        _detailView.frame = self.headerView.frame;
        _detailView.backgroundColor =[UIColor clearColor];
        _detailView.model = self.model;
        _detailView.delegate = self;
        _detailView.btnTitles = @[@"直接购买",@"加入购物车",@"详情"];
        _detailView.reloatedText = @"相关产品";
        [self.headerView addSubview:_detailView];
    }
    return _detailView;
}
- (UICollectionView *)goodColletionView{
    if (!_goodColletionView) {
        _goodLayout = [[UICollectionViewFlowLayout alloc] init];
        [_goodLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _goodLayout.itemSize = CGSizeMake(WIDTH/2 - MINLINESPACEING_RELATED/2, 0.38*HEIGHT - MINLINESPACEING_RELATED/2);
        _goodLayout.minimumLineSpacing = 0;
        _goodLayout.minimumInteritemSpacing = 0;
        _goodColletionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT - NavH) collectionViewLayout:_goodLayout];
        _goodColletionView.backgroundColor =[UIColor whiteColor];
        _goodColletionView.delegate = self;
        _goodColletionView.dataSource = self;
        _goodColletionView.showsVerticalScrollIndicator = NO;
        _goodColletionView.showsHorizontalScrollIndicator = NO;
        [_goodColletionView registerNib:[UINib nibWithNibName:@"GoodsCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellID];
        [_goodColletionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
        [self.view addSubview:_goodColletionView];
    }
    return _goodColletionView;
}

- (NSMutableArray *)goods {
    if (_goods == nil) {
        _goods = [[NSMutableArray alloc] initWithCapacity:0];;
    }
    return _goods;
}


#pragma mark --UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.goods count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
        GoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
        if (!cell) {}
        if (self.goods && [self.goods count] > 0) {
            cell.model = self.goods[indexPath.row];
        }
        
        return cell;
    
    
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, - MINLINESPACEING_RELATED, - MINLINESPACEING_RELATED);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodsCollectionViewCell *cell = (GoodsCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodsCollectionViewCell *cell = (GoodsCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        self.headerView = [_goodColletionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerID forIndexPath:indexPath];
        if(self.headerView == nil) {
            self.headerView = [[UICollectionReusableView alloc] init];
        }
//        self.headerView.backgroundColor = [UIColor greenColor];
        self.detailView.backgroundColor =[UIColor redColor];
//        [self requsetData];
        
        return self.headerView;
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (collectionView == _goodColletionView) {
        return (CGSize){WIDTH,HEIGHT - NavH};
    }else{
        return (CGSize){0,0};
    }
    
}
#pragma mark --GoodDetaiViewBtnActionDelegate
- (void)GoodDetaiViewBtnAction:(BtnActionType)type{
    switch (type) {
        case BtnActionTypeBuy:
            [self ActionTypeBuy];
            break;
        case BtnActionTypeCart:
            [self ActionTypeCart];
            break;
        case BtnActionTypeDetail:
            [self ActionTypeDetail];
            break;
            
        default:
            break;
    }
    NSLog(@"%zi",type);
}
- (void)ActionTypeBuy{
    
}
- (void)ActionTypeCart{
    
}
- (void)ActionTypeDetail{
    
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
