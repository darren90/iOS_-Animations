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

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView * imageCollectionView;

@property (nonatomic,strong)UICollectionView * titleCollectionView;


@property (nonatomic,strong)UIButton * changeBtn;


@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)NSArray * imgs;
@property (nonatomic,strong)NSArray * titles;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    [self.view addSubview:self.imageCollectionView];
    [self.view addSubview:self.titleCollectionView];
    [self.view addSubview:self.changeBtn];
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
        _imageCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(margin, 100, self.view.frame.size.width - 2*margin, 80) collectionViewLayout:[self getFlowLayout:80]];
        _imageCollectionView.scrollEnabled = NO;
        _imageCollectionView.showsVerticalScrollIndicator = NO;
        _imageCollectionView.backgroundColor = [UIColor whiteColor];
        _imageCollectionView.bounces = NO;
        _imageCollectionView.delegate = self;
        _imageCollectionView.dataSource = self;
        [_imageCollectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"imageIcon"];
        _imageCollectionView.backgroundColor = [UIColor cyanColor];
    }
    return _imageCollectionView;

}

-(UICollectionView *)titleCollectionView
{
    if (!_titleCollectionView) {
        _titleCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(margin, CGRectGetMaxY(self.imageCollectionView.frame), self.view.frame.size.width-2*margin, 30) collectionViewLayout:[self getFlowLayout:30]];
        _titleCollectionView.scrollEnabled = NO;
        _titleCollectionView.showsVerticalScrollIndicator = NO;
        _titleCollectionView.backgroundColor = [UIColor whiteColor];
        _titleCollectionView.bounces = NO;
        _titleCollectionView.delegate = self;
        _titleCollectionView.dataSource = self;
        [_titleCollectionView registerClass:[TitleCell class] forCellWithReuseIdentifier:@"title"];
        _titleCollectionView.backgroundColor = [UIColor grayColor];
    }
    return _titleCollectionView;
}

-(UIButton *)changeBtn
{
    if (!_changeBtn) {
        _changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _changeBtn.frame = CGRectMake(50, CGRectGetMaxY(self.titleCollectionView.frame), self.view.frame.size.width-2*50, 30);
        _changeBtn.layer.borderWidth = 0.5;
        _changeBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _changeBtn.backgroundColor = [UIColor whiteColor];
        _changeBtn.layer.cornerRadius = 15;
        _changeBtn.clipsToBounds = YES;
        [_changeBtn setTitle:@"换一换" forState:UIControlStateNormal];
        _changeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_changeBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_changeBtn addTarget:self action:@selector(chanageNext) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeBtn;
}


-(void)chanageNext
{

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.imageCollectionView) {

     //if ([collectionView isKindOfClass:[self.imageCollectionView class]]) {
        return self.imgs.count;
    }else{
        return self.titles.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.imageCollectionView) {
//    if ([collectionView isKindOfClass:[self.imageCollectionView class]]) {
        ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageIcon" forIndexPath:indexPath];
        cell.url = self.imgs[indexPath.row];
        return cell;
    }else{
        TitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"title" forIndexPath:indexPath];
        cell.title = self.titles[indexPath.row];
        cell.backgroundColor = [UIColor brownColor];
        return cell;
    }
}

-(NSArray *)imgs
{
    if(!_imgs){
        _imgs = @[@"https://cdn.ruguoapp.com/o_1arlie05i7tl1lj51jos6nnorgo.jpg?imageView2/0/w/120/h/120/q/30/interlace/1",

                           @"https://cdn.ruguoapp.com/o_1a94vutm61tdr5vc4o2uv1a8d3t.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

                           @"https://cdn.ruguoapp.com/o_1a9501qkj15j914v71o52g5q1qdo3m.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

                           @"https://cdn.ruguoapp.com/o_1abf29p7ilgl19lkrl629l1d3d17.png?imageView2/0/w/120/h/120/q/30",

                           @"https://cdn.ruguoapp.com/o_1a94vu844jab1mf516gm1euj1lrr6.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

                           @"https://cdn.ruguoapp.com/o_1a94vv8sg1nejjfjbbg10fv1q3v5t.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1",

                           @"https://cdn.ruguoapp.com/FgEUzMvwk8QiCWLuy2sHx-DKKHkS.jpg?imageView2/0/w/120/h/120/q/30/interlace/1",
                           
                           @"https://cdn.ruguoapp.com/o_1aa6bm0ku3m07rd1eai1f2e3h0o.jpg?imageView2/0/w/120/h/120/q/30/interlace/1",
                           
                           @"https://cdn.ruguoapp.com/o_1a94vqmsf134u19h11lablfeenh9b.jpeg?imageView2/0/w/120/h/120/q/30/interlace/1"
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
                            
                            @"侯孝贤新电影"  ];

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

 











