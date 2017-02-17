//
//  BaseTabBarController.m
//  08_ForceOrientation
//
//  Created by Fengtf on 2017/2/17.
//  Copyright © 2017年 ftf. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    NSLog(@"-tab-1-selectedVc--supportedInterfaceOrientations:%@",self.selectedViewController);
    NSLog(@"-tab-1-supportedInterfaceOrientations:%lu",(unsigned long)[self.selectedViewController supportedInterfaceOrientations]);

    return [self.selectedViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
     NSLog(@"-tab-2-selectedVc--preferredInterfaceOrientationForPresentation:%@",self.selectedViewController);
    NSLog(@"-tab-2-preferredInterfaceOrientationForPresentation:%lu",(unsigned long)[self.selectedViewController preferredInterfaceOrientationForPresentation]);

    return [self.selectedViewController preferredInterfaceOrientationForPresentation];

}


@end
