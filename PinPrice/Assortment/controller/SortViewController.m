//
//  SortViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define TIMECELL_HEIGHT 40
#define MINLINESPACEING 5
#define MINLINESPACEING_RECOMM 5
#define MINLINESPACEING_HOT 10

#define CELL_NUM 32
#define LINESPACE_Y 5

#define TAG_RECOMMEMD 10
#define TAG_HOT 11

#import "SortViewController.h"
#import "RecommendCell.h"
#import "HotCollectionViewCell.h"
#import "RecommendModel.h"
#import "HotModel.h"

@interface SortViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
//推荐
@property (strong, nonatomic) UILabel *recommendLable;
@property (strong, nonatomic) UICollectionView *recommendColletionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *recommendLayout;
//热卖
@property (strong, nonatomic) UILabel *hotLable;
@property (strong, nonatomic) UICollectionView *hotColletionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *hotLayout;
@property (strong, nonatomic) UICollectionReusableView *headerView;

// 推荐列表数组
@property (nonatomic, strong) NSMutableArray *recommends;
// 热卖列表数组
@property (nonatomic, strong) NSMutableArray *hots;
@end

static NSString *const cellID = @"GoodColletionViewCellID";

static NSString *const hotcellID = @"hotGoodColletionViewCellID";
static NSString *const hotheaderID = @"hotGoodColletionViewCellheaderID";
@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavgationBar];
    [self requestDataHot];
}
- (void)initNavgationBar{
    [self addTitleViewWithTitle:@"分类"];
}

#pragma mark --requestData
- (void)requestDataRecommend{

    if (self.recommends) {
        [self.recommends removeAllObjects];
    }
        RecommendModel *model = [[RecommendModel alloc] init];
    model.imageUrl = @"http://xqproduct.xiangqu.com/FrGW-ZP5wTyOygFKx4w9CgNF1HWy?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x891/";
    model.name = @"";
    model.price = @"";
    [self.recommends addObject:model];
    
    RecommendModel *model1 = [[RecommendModel alloc] init];
    model1.imageUrl = @"http://xqproduct.xiangqu.com/FkdKQqRGkXvToO9Wr3P4g7SF8-JN?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/700x700/";
    model1.name = @"";
    model1.price = @"";
    [self.recommends addObject:model1];
    
    RecommendModel *model2 = [[RecommendModel alloc] init];
    model2.imageUrl = @"http://xqproduct.xiangqu.com/Fku8nFowE8o6Q5KgIZ3Oa083riHo?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/460x460/";
    model2.name = @"";
    model2.price = @"";
    [self.recommends addObject:model2];
    
    RecommendModel *model3 = [[RecommendModel alloc] init];
    model3.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model3.name = @"";
    model3.price = @"";
    [self.recommends addObject:model3];
    
    RecommendModel *model4 = [[RecommendModel alloc] init];
    model4.imageUrl = @"http://xqproduct.xiangqu.com/Fjh9tUJKPi56PDopd5rnGnEd90Um?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x800/";;
    model4.name = @"";
    model4.price = @"";
    [self.recommends addObject:model4];
    
    RecommendModel *model5 = [[RecommendModel alloc] init];
    model5.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model5.name = @"";
    model5.price = @"";
    [self.recommends addObject:model5];
    
    RecommendModel *model6 = [[RecommendModel alloc] init];
    model6.imageUrl = @"http://xqproduct.xiangqu.com/Fk8Q5q_MxELt_dFWP8afoGI38kmr?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/750x500/";
    model6.name = @"";
    model6.price = @"";
    [self.recommends addObject:model6];
    
    
    [self.recommendColletionView reloadData];
}

- (void)requestDataHot{
    
    if (self.hots) {
        [self.hots removeAllObjects];
    }

    HotModel *model = [[HotModel alloc] init];
    model.imageUrl = @"http://xqproduct.xiangqu.com/Fku8nFowE8o6Q5KgIZ3Oa083riHo?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/460x460/";
    model.title = @"头骨与蛇7";
    model.price = @"45";
    model.type = @"T恤";
    model.name = @"";
    [self.hots addObject:model];
    
    HotModel *model1 = [[HotModel alloc] init];
    model1.imageUrl = @"http://xqproduct.xiangqu.com/FsA0YbOm5fioYJIpyz8rsNoG7RVh?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/700x700/";;
    model1.title = @"头骨与蛇6";
    model1.price = @"45";
    model1.type = @"T恤";
    model1.name = @"";
    [self.hots addObject:model1];
    
    HotModel *model2 = [[HotModel alloc] init];
    model2.imageUrl = @"http://xqproduct.xiangqu.com/Fjh9tUJKPi56PDopd5rnGnEd90Um?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x800/";
    model2.title = @"头骨与蛇5";
    model2.price = @"45";
    model2.type = @"T恤";
    model2.name = @"";
    [self.hots addObject:model2];
    
    HotModel *model3 = [[HotModel alloc] init];
    model3.imageUrl = @"http://xqproduct.xiangqu.com/FkdKQqRGkXvToO9Wr3P4g7SF8-JN?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/700x700/";
    model3.title = @"头骨与蛇4";
    model3.price = @"45";
    model3.type = @"T恤";
    model3.name = @"";
    [self.hots addObject:model3];
    
    HotModel *model4 = [[HotModel alloc] init];
    model4.imageUrl = @"http://xqproduct.xiangqu.com/FoYm07fprsGaSbbFYzAUXbAwMH09?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/1800x1200/";
    model4.title = @"头骨与蛇3";
    model4.price = @"45";
    model4.type = @"T恤";
    model4.name = @"";
    [self.hots addObject:model4];
    
    HotModel *model5 = [[HotModel alloc] init];
    model5.imageUrl = @"http://xqproduct.xiangqu.com/Fj2kU4K_TS8Kvolme1FhZpmB8weh?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/800x800/";
    model5.title = @"头骨与蛇2";
    model5.price = @"45";
    model5.type = @"T恤";
    model5.name = @"";
    [self.hots addObject:model5];
    
    HotModel *model6 = [[HotModel alloc] init];
    model6.imageUrl = @"http://xqproduct.xiangqu.com/FrQbHmZzI-MGDQfQGQxrggRe8TUa?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/700x700/";
    model6.title = @"头骨与蛇1";
    model6.price = @"45";
    model6.type = @"T恤";
    model6.name = @"";
    [self.hots addObject:model6];
    
    
    [self.hotColletionView reloadData];
}
#pragma mark --lazyload
- (UICollectionView *)hotColletionView{
    if (!_hotColletionView) {
        _hotLayout = [[UICollectionViewFlowLayout alloc] init];
        [_hotLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _hotLayout.itemSize = CGSizeMake(WIDTH/2 - MINLINESPACEING_HOT, 1.32*WIDTH/2);
        _hotLayout.minimumLineSpacing = 0;
        _hotLayout.minimumInteritemSpacing = 0;
        _hotColletionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT) collectionViewLayout:_hotLayout];
        _hotColletionView.backgroundColor =[UIColor whiteColor];
        _hotColletionView.delegate = self;
        _hotColletionView.dataSource = self;
        _hotColletionView.showsVerticalScrollIndicator = NO;
        _hotColletionView.showsHorizontalScrollIndicator = NO;
        [_hotColletionView registerNib:[UINib nibWithNibName:@"HotCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:hotcellID];
        [_hotColletionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:hotheaderID];
        [PinMethod addMjRefreshWithCollectView:_hotColletionView Target:self WithSelector:@selector(refreshData:) WithSelector:@selector(refreshMoreData:)];
        [self.view addSubview:_hotColletionView];
    }
    return _hotColletionView;
}


- (UICollectionView *)recommendColletionView{
    if (!_recommendColletionView) {
        _recommendLayout = [[UICollectionViewFlowLayout alloc] init];
        [_recommendLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _recommendLayout.itemSize = CGSizeMake(WIDTH/3 - MINLINESPACEING_RECOMM, WIDTH/3 - MINLINESPACEING_RECOMM);
        _recommendLayout.minimumLineSpacing = MINLINESPACEING_RECOMM;
        _recommendLayout.minimumInteritemSpacing = 0;
        _recommendColletionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,  0.065*HEIGHT, WIDTH ,WIDTH/3) collectionViewLayout:_recommendLayout];
        _recommendColletionView.backgroundColor =[UIColor whiteColor];
        _recommendColletionView.delegate = self;
        _recommendColletionView.dataSource = self;
        _recommendColletionView.showsVerticalScrollIndicator = YES;
        _recommendColletionView.showsHorizontalScrollIndicator = YES;
        _recommendColletionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        _recommendColletionView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
        _recommendColletionView.bounces = YES;
        [_recommendColletionView registerNib:[UINib nibWithNibName:@"RecommendCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellID];
        [self.headerView addSubview:_recommendColletionView];
    }
    return _recommendColletionView;
}
- (UILabel *)recommendLable{
    if (!_recommendLable) {
        _recommendLable = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, WIDTH - 15, 0.065*HEIGHT)];
        _recommendLable.textColor = RGBCOLOR(0, 158, 235);
        _recommendLable.textAlignment = NSTextAlignmentLeft;
        _recommendLable.font = [UIFont systemFontOfSize:20];
        [self.headerView addSubview:_recommendLable];
    }
    return _recommendLable;
}
- (UILabel *)hotLable{
    if (!_hotLable) {
        _hotLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.065*HEIGHT +WIDTH/3, WIDTH, 0.065*HEIGHT)];
        _hotLable.textColor = RGBCOLOR(0, 158, 235);
        _hotLable.textAlignment = NSTextAlignmentCenter;
        _hotLable.font = [UIFont systemFontOfSize:20];
        [self.headerView addSubview:_hotLable];
    }
    return _hotLable;
}

- (NSMutableArray *)recommends {
    if (_recommends == nil) {
        _recommends = [[NSMutableArray alloc] initWithCapacity:0];;
    }
    return _recommends;
}
- (NSMutableArray *)hots {
    if (_hots == nil) {
        _hots = [[NSMutableArray alloc] initWithCapacity:0];;
    }
    return _hots;
}

#pragma mark --UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView ==_hotColletionView) {
        return [self.hots count];
    }else{
        return [self.recommends count];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == _hotColletionView) {
        HotCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:hotcellID forIndexPath:indexPath];
        if (!cell) {}
        cell.tag = indexPath.row;
        if (self.hots && [self.hots count] > 0) {
            cell.model = self.hots[indexPath.row];
        }
        
        return cell;
    }else {
        RecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
        cell.tag = indexPath.row;
        if (!cell) {}
        if (self.recommends && [self.recommends count] > 0) {
        cell.model = self.recommends[indexPath.row];
    }
        
        return cell;
    }
    
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (collectionView == _hotColletionView) {
        return UIEdgeInsetsMake(0,MINLINESPACEING_HOT/2,0,MINLINESPACEING_HOT/2);
    }
    return UIEdgeInsetsMake(0, 0, - MINLINESPACEING_RECOMM, - MINLINESPACEING_RECOMM);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == _hotColletionView) {
        HotCollectionViewCell *cell = (HotCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        [self PushGoodsViewControllerWith:TAG_HOT IndexPath:indexPath];
    }else{
        RecommendCell *cell = (RecommendCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        [self PushGoodsViewControllerWith:TAG_RECOMMEMD IndexPath:indexPath];
    }
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView == _hotColletionView) {
        HotCollectionViewCell *cell = (HotCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
    }else{
        RecommendCell *cell = (RecommendCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        self.headerView = [_hotColletionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:hotheaderID forIndexPath:indexPath];
        if(self.headerView == nil) {
            self.headerView = [[UICollectionReusableView alloc] init];
        }
        self.headerView.backgroundColor = [UIColor clearColor];
        self.recommendLable.text = @"推荐品牌";
        self.hotLable.text = @"热卖分类";
        [self requestDataRecommend];
        
        return self.headerView;
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (collectionView == _hotColletionView) {
        return (CGSize){WIDTH,WIDTH/3 + 0.065*HEIGHT*2};
    }else{
        return (CGSize){0,0};
    }
    
}

#pragma mark --push
- (void)PushGoodsViewControllerWith:(NSInteger )tag IndexPath:(NSIndexPath *)indexpath{
    GoodsViewController *goods = [[GoodsViewController alloc] init];
    goods.hidesBottomBarWhenPushed = YES;
    
    switch (tag) {
        case TAG_RECOMMEMD:
            if ([self.recommends count]>0) {
                RecommendModel *model = self.recommends[indexpath.row];
                goods.model.imageUrl = model.imageUrl;
                goods.model.goodsname = model.name;
                goods.model.goodsprice = model.price;
            }
            break;
        case TAG_HOT:
            if ([self.hots count]>0) {
                HotModel *model = self.hots[indexpath.row];
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
