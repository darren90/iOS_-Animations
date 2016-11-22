//
//  TitleCell.m
//  01_ChangeNext_OC
//
//  Created by Fengtf on 2016/11/22.
//  Copyright © 2016年 ftf. All rights reserved.
//

#import "TitleCell.h"

@interface TitleCell()


@property (nonatomic,weak)UILabel * titleL;


@end

@implementation TitleCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *titleL = [[UILabel alloc]init];
        titleL.textColor = [UIColor blackColor];
        titleL.font = [UIFont systemFontOfSize:12];
        self.titleL = titleL;
        titleL.numberOfLines = 2;
        titleL.textAlignment = NSTextAlignmentLeft;
        [titleL sizeToFit];
        [self addSubview:titleL];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];

    self.titleL.frame = self.bounds;
}


-(void)setTitle:(NSString *)title
{
    _title = title;

    self.titleL.text = title;
}




@end
