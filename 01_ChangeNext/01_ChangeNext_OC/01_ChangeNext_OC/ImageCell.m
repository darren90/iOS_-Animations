//
//  ImageCell.m
//  01_ChangeNext_OC
//
//  Created by Fengtf on 2016/11/22.
//  Copyright © 2016年 ftf. All rights reserved.
//

#import "ImageCell.h"
#import "UIImageView+WebCache.h"

@interface ImageCell()


@property (nonatomic,weak)UIImageView * imageView;

@end


@implementation ImageCell


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc]init];
        self.imageView = imageView;
        [self addSubview:imageView];
        imageView.layer.cornerRadius = 10;
        imageView.clipsToBounds = YES;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];

    self.imageView.frame = self.bounds;
}

-(void)setUrl:(NSString *)url
{
    _url = url;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:url]];
}

@end





