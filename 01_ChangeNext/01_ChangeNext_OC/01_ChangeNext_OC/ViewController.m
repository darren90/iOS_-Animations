//
//  ViewController.m
//  01_ChangeNext_OC
//
//  Created by Fengtf on 2016/11/22.
//  Copyright © 2016年 ftf. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"
#import "TitleCell.h"

#define margin 20
#define ImagH 80
#define titleH 36
#define maxCount 3

#define TotalSection  100

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView * imageCollectionView;

@property (nonatomic,strong)UICollectionView * titleCollectionView;


@property (nonatomic,strong)UIButton * changeBtn;


@property (nonatomic,assign)NSInteger scrollCount;

@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)NSArray * imgs;
@property (nonatomic,strong)NSArray * titles;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.automaticallyAdjustsScrollViewInsets = NO;

    [self.view addSubview:self.imageCollectionView];
    [self.view addSubview:self.titleCollectionView];
    [self.view addSubview:self.changeBtn];

//    [self.imageCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:TotalSection / 2] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
//    [self.titleCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:TotalSection / 2] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
}

-(UICollectionViewFlowLayout *)getFlowLayout:(CGFloat)itemH
{
    CGFloat row = 3;
    CGFloat itemW = (self.view.frame.size.width - (row+1)*margin) / 3;

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(itemW, itemH);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;

    return layout;
}

-(UICollectionView *)imageCollectionView
{
    if (!_imageCollectionView) {
        _imageCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(margin, 100, self.view.frame.size.width - 2*margin, ImagH) collectionViewLayout:[self getFlowLayout:ImagH]];
        _imageCollectionView.scrollEnabled = NO;
        _imageCollectionView.showsVerticalScrollIndicator = NO;
        _imageCollectionView.backgroundColor = [UIColor whiteColor];
        _imageCollectionView.bounces = NO;
        _imageCollectionView.delegate = self;
        _imageCollectionView.dataSource = self;
        [_imageCollectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"imageIcon"];
    }
    return _imageCollectionView;

}

-(UICollectionView *)titleCollectionView
{
    if (!_titleCollectionView) {
        _titleCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(margin, CGRectGetMaxY(self.imageCollectionView.frame)+10, self.view.frame.size.width-2*margin, titleH) collectionViewLayout:[self getFlowLayout:titleH]];
        _titleCollectionView.scrollEnabled = NO;
        _titleCollectionView.showsVerticalScrollIndicator = NO;
        _titleCollectionView.backgroundColor = [UIColor whiteColor];
        _titleCollectionView.bounces = NO;
        _titleCollectionView.delegate = self;
        _titleCollectionView.dataSource = self;
        [_titleCollectionView registerClass:[TitleCell class] forCellWithReuseIdentifier:@"title"];
    }
    return _titleCollectionView;
}

-(UIButton *)changeBtn
{
    if (!_changeBtn) {
        _changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _changeBtn.frame = CGRectMake(50, CGRectGetMaxY(self.titleCollectionView.frame)+10, self.view.frame.size.width-2*50, 30);
        _changeBtn.layer.borderWidth = 0.5;
        _changeBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _changeBtn.backgroundColor = [UIColor whiteColor];
        _changeBtn.layer.cornerRadius = 15;
        _changeBtn.clipsToBounds = YES;
        [_changeBtn setTitle:@" 换一换" forState:UIControlStateNormal];
        [_changeBtn setImage:[UIImage imageNamed:@"change"] forState:UIControlStateNormal];
        _changeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_changeBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_changeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [_changeBtn addTarget:self action:@selector(chanageNext) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeBtn;
}


-(void)chanageNext
{
    UIImageView *imgView = self.changeBtn.imageView;
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 0.8;
    [imgView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];

     NSLog(@"---chanageNext---");
    [self srollImage:ImagH isAnimation:YES];
    [self srollLabel:titleH isAnimation:YES];
    self.scrollCount += 1;
}


-(void)srollImage:(CGFloat)offsetY isAnimation:(BOOL)isAnimation
{
    CGFloat imageY = (self.imgs.count / maxCount) * ImagH - ImagH;
    CGRect imageRect = CGRectMake(0, imageY - self.scrollCount * offsetY, self.imageCollectionView.frame.size.width, self.imageCollectionView.frame.size.height);

    NSLog(@"--scrollCount:%ld,--imageRect:%@",(long)_scrollCount,NSStringFromCGRect(imageRect));
    if (self.scrollCount == -1) {
        [self.imageCollectionView scrollRectToVisible:imageRect animated:NO];
    }else{
        [self.imageCollectionView scrollRectToVisible:imageRect animated:isAnimation];
    }

}

-(void)srollLabel:(CGFloat)offsetY isAnimation:(BOOL)isAnimation
{
    CGFloat labelY = (self.titles.count / maxCount) * titleH - titleH;
    CGRect labelRect = CGRectMake(0, labelY - self.scrollCount * offsetY, self.titleCollectionView.frame.size.width, self.titleCollectionView.frame.size.height);

    if (labelRect.origin.y<=0) {
        self.scrollCount = -1;
    }

    if (self.scrollCount == -1) {
        [self.titleCollectionView scrollRectToVisible:labelRect animated:NO];
    }else{
        [self.titleCollectionView scrollRectToVisible:labelRect animated:isAnimation];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"---contentOffsetY:%f",scrollView.contentOffset.y);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return TotalSection;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.imageCollectionView) {
        return self.imgs.count;
    }else{
        return self.titles.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.imageCollectionView) {
        ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageIcon" forIndexPath:indexPath];
        cell.url = self.imgs[indexPath.row];
        return cell;
    }else{
        TitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"title" forIndexPath:indexPath];
        cell.title = self.titles[indexPath.row];
        return cell;
    }
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"---willDisplayCell---");
    if (collectionView == self.imageCollectionView) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self srollImage:0 isAnimation:NO];
        });
    }else{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self srollLabel:0 isAnimation:NO];
        });
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{

}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    NSLog(@"---scrollViewDidEndDecelerating----");
//
//    float contentOffsetScrolledRight = self.imageCollectionView.frame.size.width * ([self.imgs count] -1);
//    if (scrollView.contentOffset.x == contentOffsetScrolledRight) {
//        NSIndexPath *path = [NSIndexPath indexPathForRow:1 inSection:0];
//        [self.imageCollectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
//    }else if (scrollView.contentOffset.x == 0){
//        NSIndexPath *path = [NSIndexPath indexPathForRow:self.imgs.count-2 inSection:0];
//        [self.imageCollectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
//    }
//}


-(NSArray *)imgs
{
    if(!_imgs){
        _imgs = @[
                            @"https://cdn.ruguoapp.com/o_1arlie05i7tl1lj51jos6nnorgo.jpg?imageView2/0/w/120/h/120/q/30/interlace/1",

                           @"https://cdn.ruguoapp.com/o_1a94vutm61tdr5vc4o2uv1a8d3t.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

                           @"https://cdn.ruguoapp.com/o_1a9501qkj15j914v71o52g5q1qdo3m.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

                           @"https://cdn.ruguoapp.com/o_1abf29p7ilgl19lkrl629l1d3d17.png?imageView2/0/w/120/h/120/q/30",

                           @"https://cdn.ruguoapp.com/o_1a94vu844jab1mf516gm1euj1lrr6.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

                           @"https://cdn.ruguoapp.com/o_1a94vv8sg1nejjfjbbg10fv1q3v5t.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

                           @"https://cdn.ruguoapp.com/FgEUzMvwk8QiCWLuy2sHx-DKKHkS.jpg?imageView2/0/w/120/h/120/q/30/interlace/1",
                           
                           @"https://cdn.ruguoapp.com/o_1aa6bm0ku3m07rd1eai1f2e3h0o.jpg?imageView2/0/w/120/h/120/q/30/interlace/1",
                           
                           @"https://cdn.ruguoapp.com/o_1a94vqmsf134u19h11lablfeenh9b.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

                            @"https://cdn.ruguoapp.com/o_1aklbgu2v38q1sla1s966nla1m.jpg?imageView2/0/w/120/h/120/q/30/interlace/1",

                            @"https://cdn.ruguoapp.com/o_1a94vp9imur31288cr21ef9ol1b.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

                            @"https://cdn.ruguoapp.com/o_1ah5scjl1f0a1qogdm2gpt4u4j.png?imageView2/0/w/120/h/120/q/30",

                            @"https://cdn.ruguoapp.com/o_1af8d3pq0ugjsai1akr1mcjlvs1g.png?imageView2/0/w/120/h/120/q/30",

                            @"https://cdn.ruguoapp.com/o_1a94vucfamf31e3dqvt3f116j310.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

                            @"https://cdn.ruguoapp.com/o_1a94vqbnb13l5sj2nu81tr81m887b.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1"
                           ];
    }
    return _imgs;
}

-(NSArray *)titles
{
    if (!_titles) {
        _titles = @[@"三大影展获奖影片上映",

                            @"昆汀有新电影提醒",

                            @"诺兰新片",

                            @"索尼新品",
                            
                            @"大城小店",
                            
                            @"标准收藏CC新DVD",
                            
                            @"ZARA打折",
                            
                            @"火箭队新闻",
                            
                            @"侯孝贤新电影",

                            @"Engadget新评测",

                            @"Google Doodle",

                            @"iOS人机界面指南更新",

                            @"短视频推荐",

                            @"小众软件",

                            @"上海电影节"
                    ];

    }
    return _titles;
}

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];



    }
    return _dataArr;
}



@end

 











