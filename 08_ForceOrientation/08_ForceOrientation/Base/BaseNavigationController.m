//
//  BaseNavigationController.m
//  08_ForceOrientation
//
//  Created by Fengtf on 2017/2/17.
//  Copyright © 2017年 ftf. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    // fix 'nested pop animation can result in corrupted navigation bar'
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }

    [super pushViewController:viewController animated:animated];
}



- (BOOL)shouldAutorotate{
    return YES;
}

//- (BOOL)shouldAutorotate{
//    //NSLog(@"####################%d",[[self.viewControllers lastObject] shouldAutorotate]);
//    return [[self.viewControllers lastObject] shouldAutorotate];
//}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    NSLog(@"-nav-1-supportedInterfaceOrientations:%lu",(unsigned long)[self.topViewController supportedInterfaceOrientations]);
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    NSLog(@"-nav-2-preferredInterfaceOrientationForPresentation:%lu",(unsigned long)[self.topViewController preferredInterfaceOrientationForPresentation]);

    return [self.topViewController preferredInterfaceOrientationForPresentation];
}


@end
