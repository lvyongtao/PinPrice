//
//  GoodsViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
//#define TIMECELL_HEIGHT 40
//#define MINLINESPACEING 5
#define MINLINESPACEING_RELATED 5


//#define CELL_NUM 32
//#define LINESPACE_Y 5

#import "GoodDetaiView.h"
#import "GoodsCollectionViewCell.h"
#import "BuyGoodsViewController.h"
#import "ShoppingCartViewController.h"
#import "DetailGoodsViewController.h"


@interface GoodsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,GoodDetaiViewBtnActionDelegate>

//@property (strong, nonatomic) UIButton *rightBtn;
//商品详情的视图
@property (strong, nonatomic) GoodDetaiView *detailView;
/**
 *  相关商品的推荐
 */
@property (strong, nonatomic) UICollectionView *goodColletionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *goodLayout;
//头视图
@property (strong, nonatomic) UICollectionReusableView *headerView;


//@property (strong, nonatomic) UIImageView *animationImage;

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
    [self addRightBtnswithImage1:[UIImage imageNamed:@"goodcollect"] withImage2:[UIImage imageNamed:@"ShoppingCart_selected"] withTitleColor:[UIColor clearColor] withTarget:self withMethod:@selector(rightButtonClick:)];
}
- (void)rightButtonClick:(UIButton *)btn{
    switch (btn.tag) {
        case 0:
            // 收藏
            btn.selected = !btn.selected;
            btn.selected?[btn setImage:[UIImage imageNamed:@"goodcollect_selected"] forState:UIControlStateNormal]:[btn setImage:[UIImage imageNamed:@"goodcollect"] forState:UIControlStateNormal];
            btn.selected?[self showMessageTitle:@"已收藏商品"]:[self showMessageTitle:@"取消收藏商品"];;
            break;
        case 1:
            // 购物车
            [self pushCart];
            break;
            
        default:
            break;
    }
}
- (void)initgoodColletionView{
    
    [self requsetData];
    
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
- (DetailGoodsModel *)model{
    if (!_model) {
        _model = [[DetailGoodsModel alloc] init];
    }
    return _model;
}
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
        _goodLayout.itemSize = CGSizeMake(WIDTH/2 - MINLINESPACEING_RELATED/2, 1.5*WIDTH/2);
        _goodLayout.minimumLineSpacing = 0;
        _goodLayout.minimumInteritemSpacing = 0;
        _goodColletionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT) collectionViewLayout:_goodLayout];
        _goodColletionView.backgroundColor =[UIColor whiteColor];
        _goodColletionView.delegate = self;
        _goodColletionView.dataSource = self;
        _goodColletionView.showsVerticalScrollIndicator = NO;
        _goodColletionView.showsHorizontalScrollIndicator = NO;
//        [_goodColletionView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        [_goodColletionView registerNib:[UINib nibWithNibName:@"GoodsCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellID];
        [_goodColletionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
        [PinMethod addMjRefreshWithCollectView:_goodColletionView Target:self WithSelector:@selector(refreshData:) WithSelector:@selector(refreshMoreData:)];
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

//- (UIImageView *)animationImage{
//    if (!_animationImage) {
//        _animationImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
//        //CGRectMake(WIDTH/2,0.78*(HEIGHT + 0.11*HEIGHT - NavH), 30, 30)
//        [_animationImage sd_setImageWithURL:[NSURL URLWithString:self.model.imageUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
//        _animationImage.backgroundColor =[UIColor redColor];
//        [self.view addSubview:_animationImage];
//    }
//    return _animationImage;
//}
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
    if ([self.goods count] > 0) {
        
        GoodsViewController *good = [[GoodsViewController alloc] init];
//        good.model.imageUrl = model.imageUrl;
//        good.model.goodsname = model.title;
//        good.model.goodsprice = model.price;
        [self.navigationController pushViewController:good animated:YES];
    }
    
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
        return (CGSize){WIDTH,HEIGHT + 0.11*HEIGHT - NavH};
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
//购买
- (void)ActionTypeBuy{
    
    BuyGoodsViewController *buy = [[BuyGoodsViewController alloc] init];
    buy.model.price = self.model.goodsprice;
    buy.model.name = self.model.goodsname;
    buy.model.imageUrl = self.model.imageUrl;
    buy.type = 0;
    [self.navigationController pushViewController:buy animated:YES];
}
//加入购物车
- (void)ActionTypeCart{

    [UIView animateWithDuration:0.3f animations:^{
        [self.detailView startAnimationImage];
    } completion:^(BOOL finished) {
        [self.detailView resetAnimaitonImage];
        [self showMessageTitle:@"加入购物车成功"];
        NSLog(@"完成");
    }];

}

//商品详情
- (void)ActionTypeDetail{
    DetailGoodsViewController *detail =[[DetailGoodsViewController alloc] init];
    detail.url = @"http://v.juhe.cn/weixin/redirect?wid=wechat_20160825023108";
    [self.navigationController pushViewController:detail animated:YES];
}

//跳转购物车
- (void)pushCart{
    ShoppingCartViewController *shopcart = [[ShoppingCartViewController alloc] init];
    shopcart.hidesBottomBarWhenPushed = YES;
    shopcart.isPush = YES;
    [self.navigationController pushViewController:shopcart animated:YES];
    
    
    //        PinTabBarController *tabBar=[[PinTabBarController alloc] init];
    //        tabBar.selectedIndex=2;
    //        tabBar.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    //        tabBar.modalPresentationStyle = UIModalPresentationPageSheet;
    //        [self presentViewController:tabBar animated:YES completion:nil];
}
#pragma mark --MJRefresh
- (void)refreshData:(MJRefreshNormalHeader *)header{
    
    [header endRefreshing];
}

- (void)refreshMoreData:(MJRefreshAutoNormalFooter *)footer{
    [footer endRefreshing];
}
#pragma mark --KVO
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
//    if ([keyPath isEqualToString:@"contentOffset"]) {
//
//    }
//}
- (void)dealloc{

//    [self.goodColletionView removeObserver:self forKeyPath:@"contentOffset"];
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
