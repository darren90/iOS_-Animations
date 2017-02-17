//
//  HomeDetail2Controller.m
//  08_ForceOrientation
//
//  Created by Fengtf on 2017/2/17.
//  Copyright © 2017年 ftf. All rights reserved.
//

#import "HomeDetail2Controller.h"

@interface HomeDetail2Controller ()

@end

@implementation HomeDetail2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape ;
}

- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationLandscapeRight;
}


@end
