//
//  IndexViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/8.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#define MINLINESPACEING 5
#define MINLINESPACEING_ALL 10

#define TIMECELL_HEIGHT 40
#define CELL_NUM 32
#define LINESPACE_Y 5

#define TAG_ALL 10
#define TAG_LIKE 11

#import "IndexViewController.h"
#import "SDCycleScrollView.h"
#import "GoodCollectionViewLayout.h"
#import "PinGood.h"
#import "LikeCollectionViewCell.h"
#import "AllCollectionViewCell.h"

@interface IndexViewController ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
//轮播图
@property (strong, nonatomic) SDCycleScrollView *imageScrollerView;
/**
 *  猜你喜欢
 */
@property (strong, nonatomic) UILabel *likeLable;
@property (strong, nonatomic) UICollectionView *likeGoodColletionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *likeGoodLayout;
/**
 *  全部商品
 */
@property (strong, nonatomic) UILabel *allGoodLable;
@property (strong, nonatomic) UICollectionView *allGoodColletionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *allGoodLayout;
//头视图
@property (strong, nonatomic) UICollectionReusableView *headerView;
//轮播图数组
@property (strong, nonatomic) NSMutableArray *picArray;
//轮播图列表数组
@property (strong, nonatomic) NSMutableArray *circleGoods;
// 喜欢列表数组
@property (nonatomic, strong) NSMutableArray *likeGoods;
// 全部列表数组
@property (nonatomic, strong) NSMutableArray *allGoods;
// 当前的数据索引
@property (nonatomic, assign) NSInteger index;
@end
static NSString *const cellID = @"likeGoodColletionViewCellID";

static NSString *const allcellID = @"allGoodColletionViewCellID";
static NSString *const allheaderID = @"allGoodColletionViewCellheaderID";

@implementation IndexViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initSDCycleScrollView];
    
}
#pragma mark --requestData
- (void)requestData{
    
    
    if (self.picArray) {
        [self.picArray removeAllObjects];
    }
    if (self.circleGoods) {
        [self.circleGoods removeAllObjects];
    }
    CircleGoodsModel *model11 = [[CircleGoodsModel alloc] init];
    model11.imageUrl = @"http://xqproduct.xiangqu.com/FnV26KwCeWQLKeM0fP_Z2ji8N7jx?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x800/";
    model11.name = @"呢子大衣";
    model11.price = @"499.00";
    [self.circleGoods addObject:model11];
    [self.picArray addObject:model11.imageUrl];
    
    CircleGoodsModel *model12 = [[CircleGoodsModel alloc] init];
    model12.imageUrl = @"http://xqproduct.xiangqu.com/FriKyuGokf31Gl8z-GHdox6JQDeC?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x800/";
    model12.name = @"羊皮包";
    model12.price = @"199.00";
    [self.circleGoods addObject:model12];
    [self.picArray addObject:model12.imageUrl];
    
    CircleGoodsModel *model13 = [[CircleGoodsModel alloc] init];
    model13.imageUrl = @"http://xqproduct.xiangqu.com/FioL8alfT2qj-Ik9rvHZx8GdQIf3?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/1080x1080/";
    model13.name = @"白色外套黑色裤子宽松套装";
    model13.price = @"299.00";
    [self.circleGoods addObject:model13];
    [self.picArray addObject:model13.imageUrl];
    
    CircleGoodsModel *model14 = [[CircleGoodsModel alloc] init];
    model14.imageUrl = @"http://xqproduct.xiangqu.com/FmuXsACTpHAr01JqCAuFyUxQz1PC?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/500x500/";
    model14.name = @"围巾";
    model14.price = @"99.00";
    [self.circleGoods addObject:model14];
    [self.picArray addObject:model14.imageUrl];
    
    self.imageScrollerView.imageURLStringsGroup = [self.picArray copy];
    
    
    
    if (self.likeGoods) {
        [self.likeGoods removeAllObjects];
    }
    
    LikeGoodsModel *model = [[LikeGoodsModel alloc] init];
    model.imageUrl = @"http://xqproduct.xiangqu.com/FrGW-ZP5wTyOygFKx4w9CgNF1HWy?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x891/";
    model.name = @"上衣";
    model.price = @"299.00";
    [self.likeGoods addObject:model];
    
    
    LikeGoodsModel *model1 = [[LikeGoodsModel alloc] init];
    model1.imageUrl = @"http://xqproduct.xiangqu.com/Fj2kU4K_TS8Kvolme1FhZpmB8weh?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x800/";
    model1.name = @"裤子";
    model1.price = @"99.00";
    [self.likeGoods addObject:model1];
    
    LikeGoodsModel *model2 = [[LikeGoodsModel alloc] init];
    model2.imageUrl = @"http://xqproduct.xiangqu.com/FoYm07fprsGaSbbFYzAUXbAwMH09?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/1800x1200/";
    model2.name = @"皮夹克";
    model2.price = @"499.00";
    [self.likeGoods addObject:model2];
    
    LikeGoodsModel *model3 = [[LikeGoodsModel alloc] init];
    model3.imageUrl = @"http://xqproduct.xiangqu.com/FtZi61HZ-njzBmI6vit1mlzeiFkX?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/1200x1200/";
    model3.name = @"大衣";
    model3.price = @"199.00";
    [self.likeGoods addObject:model3];
    
    LikeGoodsModel *model4 = [[LikeGoodsModel alloc] init];
    model4.imageUrl = @"http://xqproduct.xiangqu.com/Fku8nFowE8o6Q5KgIZ3Oa083riHo?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/460x460/";
    model4.name = @"戒指";
    model4.price = @"1999.00";
    [self.likeGoods addObject:model4];
    [self.likeGoodColletionView reloadData];
    
    
    
  
}
#pragma mark --init
/**
 *  加载数据
 */
//- (void)loadData {
//    NSArray *goods = [PinGood goodsWithIndex:self.index];
//    [self.goodsList addObjectsFromArray:goods];
//    self.index++;
//    // 设置布局的属性
//    self.allGoodLayout.columnCount = 2;
//    self.allGoodLayout.goodsList = self.goodsList;
//    // 刷新数据
//    [self.allGoodColletionView reloadData];
//}
- (void)initSDCycleScrollView{
    //self.imageScrollerView.backgroundColor =[UIColor clearColor];
    if (self.allGoods) {
        [self.allGoods removeAllObjects];
    }
    AllGoodsModel *model = [[AllGoodsModel alloc] init];
    model.imageUrl = @"http://xqproduct.xiangqu.com/FlwTFO1LitdE9lrZd0B1VAbKrQGx?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x800/";
    model.name = @"精致吊坠";
    model.price = @"99.00";
    [self.allGoods addObject:model];
    
    AllGoodsModel *model1 = [[AllGoodsModel alloc] init];
    model1.imageUrl = @"http://xqproduct.xiangqu.com/FpSm2AU4B96AsbKE_1021gu-SD3c?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/742x609/";
    model1.name = @"男士手表";
    model1.price = @"399.00";
    [self.allGoods addObject:model1];
    
    AllGoodsModel *model2 = [[AllGoodsModel alloc] init];
    model2.imageUrl = @"http://xqproduct.xiangqu.com/FkU3_nLfqLLkjP5-nbaZLXvFOi2i?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/377x533/";
    model2.name = @"女士品牌口红";
    model2.price = @"299.00";
    [self.allGoods addObject:model2];
    
    AllGoodsModel *model3 = [[AllGoodsModel alloc] init];
    model3.imageUrl = @"http://xqproduct.xiangqu.com/Fr2nGMpkIvly2DO3475qweDLAV51?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x800/";
    model3.name = @"女士手表";
    model3.price = @"499.00";
    [self.allGoods addObject:model3];
    
    AllGoodsModel *model4 = [[AllGoodsModel alloc] init];
    model4.imageUrl = @"http://xqproduct.xiangqu.com/Fq3xsgPP3kCHc7E4LF1u3hTHbWmM?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x800/";
    model4.name = @"麋鹿挂件";
    model4.price = @"69.00";
    [self.allGoods addObject:model4];
    
    [self.allGoodColletionView reloadData];
}
#pragma mark --lazyload
- (UICollectionView *)allGoodColletionView{
    if (!_allGoodColletionView) {
        _allGoodLayout = [[UICollectionViewFlowLayout alloc] init];
        [_allGoodLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _allGoodLayout.itemSize = CGSizeMake(WIDTH/2 - MINLINESPACEING_ALL/2, 0.38*HEIGHT - MINLINESPACEING_ALL/2);
        _allGoodLayout.minimumLineSpacing = 0;
        _allGoodLayout.minimumInteritemSpacing = 0;
        _allGoodColletionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT) collectionViewLayout:_allGoodLayout];
        _allGoodColletionView.tag = TAG_LIKE;
        _allGoodColletionView.backgroundColor =[UIColor whiteColor];
        _allGoodColletionView.delegate = self;
        _allGoodColletionView.dataSource = self;
        _allGoodColletionView.showsVerticalScrollIndicator = NO;
        _allGoodColletionView.showsHorizontalScrollIndicator = NO;
//        _allGoodColletionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//        _allGoodColletionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
//        _allGoodColletionView.bounces = YES;
         [_allGoodColletionView registerNib:[UINib nibWithNibName:@"AllCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:allcellID];
//        [_allGoodColletionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:allcellID];
         [_allGoodColletionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:allheaderID];
        [self.view addSubview:_allGoodColletionView];
        [PinMethod addMjRefreshWithCollectView:_allGoodColletionView Target:self WithSelector:@selector(refreshData:) WithSelector:@selector(refreshMoreData:)];
    }
    return _allGoodColletionView;
}
- (SDCycleScrollView *)imageScrollerView{
    if (!_imageScrollerView) {
        
        _imageScrollerView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0,0, WIDTH,0.3*HEIGHT)];
        _imageScrollerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _imageScrollerView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        _imageScrollerView.backgroundColor =[UIColor whiteColor];
        _imageScrollerView.dotColor = [UIColor greenColor];
        _imageScrollerView.delegate = self;
        _imageScrollerView.autoScrollTimeInterval = 3.0f;
        _imageScrollerView.placeholderImage = [UIImage imageNamed:@"login_bgImage"];
        [self.headerView addSubview:_imageScrollerView];
    }
    return _imageScrollerView;
}

- (UICollectionView *)likeGoodColletionView{
    if (!_likeGoodColletionView) {
        _likeGoodLayout = [[UICollectionViewFlowLayout alloc] init];
        [_likeGoodLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _likeGoodLayout.itemSize = CGSizeMake(WIDTH/2, 0.2*HEIGHT);
        _likeGoodLayout.minimumLineSpacing = 0;
        _likeGoodLayout.minimumInteritemSpacing = 0;
        _likeGoodColletionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0.3*HEIGHT + 0.065*HEIGHT, WIDTH ,0.2*HEIGHT) collectionViewLayout:_likeGoodLayout];
        _likeGoodColletionView.tag = TAG_LIKE;
        _likeGoodColletionView.backgroundColor =[UIColor whiteColor];
        _likeGoodColletionView.delegate = self;
        _likeGoodColletionView.dataSource = self;
        _likeGoodColletionView.showsVerticalScrollIndicator = YES;
        _likeGoodColletionView.showsHorizontalScrollIndicator = YES;
        _likeGoodColletionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        _likeGoodColletionView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
        _likeGoodColletionView.bounces = YES;
        [_likeGoodColletionView registerNib:[UINib nibWithNibName:@"LikeCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellID];
//        [_likeGoodColletionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
       // [_likeGoodColletionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
        [self.headerView addSubview:_likeGoodColletionView];
    }
    return _likeGoodColletionView;
}
- (UILabel *)likeLable{
    if (!_likeLable) {
        _likeLable = [[UILabel alloc] initWithFrame:CGRectMake(15, 0.3*HEIGHT, WIDTH - 15, 0.065*HEIGHT)];
        _likeLable.textColor = RGBCOLOR(0, 158, 235);
        _likeLable.textAlignment = NSTextAlignmentLeft;
        _likeLable.font = [UIFont systemFontOfSize:20];
        [self.headerView addSubview:_likeLable];
    }
    return _likeLable;
}
- (UILabel *)allGoodLable{
    if (!_allGoodLable) {
        _allGoodLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.3*HEIGHT + 0.065*HEIGHT +0.2*HEIGHT, WIDTH, 0.065*HEIGHT)];
        _allGoodLable.textColor = RGBCOLOR(0, 158, 235);
        _allGoodLable.textAlignment = NSTextAlignmentCenter;
        _allGoodLable.font = [UIFont systemFontOfSize:20];
        [self.headerView addSubview:_allGoodLable];
    }
    return _allGoodLable;
}
- (NSMutableArray *)picArray{
    if (!_picArray) {
        _picArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _picArray;
}
- (NSMutableArray *)circleGoods {
    if (_circleGoods == nil) {
        _circleGoods = [[NSMutableArray alloc] initWithCapacity:0];;
    }
    return _circleGoods;
}
- (NSMutableArray *)likeGoods {
    if (_likeGoods == nil) {
        _likeGoods = [[NSMutableArray alloc] initWithCapacity:0];;
    }
    return _likeGoods;
}
- (NSMutableArray *)allGoods {
    if (_allGoods == nil) {
        _allGoods = [[NSMutableArray alloc] initWithCapacity:0];;
    }
    return _allGoods;
}
#pragma mark --SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
//    NSLog(@"%ld",index);
    if ([self.circleGoods count] > 0) {
        CircleGoodsModel *model =self.circleGoods[index];
        
        GoodsViewController *goods = [[GoodsViewController alloc] init];
        goods.hidesBottomBarWhenPushed = YES;
        goods.model.imageUrl = model.imageUrl;
        goods.model.goodsname = model.name;
        goods.model.goodsprice = model.price;
        [self.navigationController pushViewController:goods animated:YES];
    }
}
#pragma mark --UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView ==_allGoodColletionView) {
        return [self.allGoods count];
    }else{
        return [self.likeGoods count];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == _allGoodColletionView) {
        AllCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:allcellID forIndexPath:indexPath];
        if (!cell) {}
        if (self.allGoods && [self.allGoods count] > 0) {
            AllGoodsModel *model = self.allGoods[indexPath.row];
            model.index = indexPath.row;
            cell.backgroundColor = [UIColor clearColor];
            [cell setValueWithModel:model];
        }
        
        return cell;
    }else {
        LikeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
        if (!cell) {}
        if (self.likeGoods && [self.likeGoods count] > 0) {
            LikeGoodsModel *model = self.likeGoods[indexPath.row];
            model.index = indexPath.row;
            cell.backgroundColor = [UIColor clearColor];
            [cell setValueWithModel:model];
        }
        
        return cell;
    }

}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (collectionView == _allGoodColletionView) {
        return UIEdgeInsetsMake(0, 0,0,0);
    }
       return UIEdgeInsetsZero;
 }
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == _allGoodColletionView) {
        AllCollectionViewCell *cell = (AllCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        [self PushGoodsViewControllerWith:TAG_ALL IndexPath:indexPath];
    }else{
        LikeCollectionViewCell *cell = (LikeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        [self PushGoodsViewControllerWith:TAG_LIKE IndexPath:indexPath];
    }
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView == _allGoodColletionView) {
        AllCollectionViewCell *cell = (AllCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
    }else{
        LikeCollectionViewCell *cell = (LikeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
     
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        self.headerView = [_allGoodColletionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:allheaderID forIndexPath:indexPath];
        if(self.headerView == nil) {
            self.headerView = [[UICollectionReusableView alloc] init];
        }
        self.headerView.backgroundColor = [UIColor clearColor];
        self.likeLable.text = @"猜你喜欢";
        self.allGoodLable.text = @"全部商品";
        [self requestData];

        return self.headerView;
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (collectionView == _allGoodColletionView) {
        return (CGSize){WIDTH,0.63*HEIGHT};
    }else{
        return (CGSize){0,0};
    }
    
}
#pragma mark --push
- (void)PushGoodsViewControllerWith:(NSInteger )tag IndexPath:(NSIndexPath *)indexpath{
    GoodsViewController *goods = [[GoodsViewController alloc] init];
    goods.hidesBottomBarWhenPushed = YES;
    
    switch (tag) {
        case TAG_LIKE:
            if ([self.likeGoods count]>0) {
                LikeGoodsModel *model = self.likeGoods[indexpath.row];
                goods.model.imageUrl = model.imageUrl;
                goods.model.goodsname = model.name;
                goods.model.goodsprice = model.price;
            }
            break;
        case TAG_ALL:
            if ([self.allGoods count]>0) {
                AllGoodsModel *model = self.allGoods[indexpath.row];
                goods.model.imageUrl = model.imageUrl;
                goods.model.goodsname = model.name;
                goods.model.goodsprice = model.price;
            }
            break;
            
        default:
            break;
    }
    NSLog(@"跳转商品");
    [self.navigationController pushViewController:goods animated:YES];
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
