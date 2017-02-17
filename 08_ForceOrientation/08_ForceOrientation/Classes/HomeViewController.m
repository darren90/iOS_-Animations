//
//  HomeViewController.m
//  08_ForceOrientation
//
//  Created by Fengtf on 2017/2/17.
//  Copyright © 2017年 ftf. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeDetailController.h"
#import "HomeDetail2Controller.h"
#import "HomeModarDetailController.h"
#import "PlayerViewController.h"

@interface HomeViewController ()

@property (nonatomic,assign)BOOL isAuto;

@property (nonatomic,weak)PlayerViewController *playerVc;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PlayerViewController *playerVc = [[PlayerViewController alloc]init];
    [self addChildViewController:playerVc];
    self.playerVc = playerVc;
    playerVc.view.frame = CGRectMake(10, 10, self.view.frame.size.width-20, 100);
    [self.view addSubview:playerVc.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)forceRight:(UIButton *)sender {

}

- (IBAction)forceLeft:(UIButton *)sender {

}


- (IBAction)forceGravity:(UIButton *)sender {
    self.isAuto = YES;
}

- (IBAction)NextAction:(UIButton *)sender {

    HomeDetailController *detailVc = (HomeDetailController *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"HomeDetailController"];
//    HomeDetailController *detailVc = [[HomeDetailController alloc]init];
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (IBAction)next2Action:(UIButton *)sender {
    HomeDetail2Controller *detailVc = [[HomeDetail2Controller alloc]init];
    [self.navigationController pushViewController:detailVc animated:YES];
}
- (IBAction)modarNextAction:(UIButton *)sender {
    HomeModarDetailController *vc = [[HomeModarDetailController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
//    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)modarNextAction2:(UIButton *)sender {
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    NSArray *arr = self.childViewControllers;
    UIViewController *vc = arr.firstObject;
//    NSLog(@"--arr:%@",arr);
    if (self.isAuto && vc != nil) {
        NSLog(@"---转------");
        return UIInterfaceOrientationMaskLandscape;
    }
    return UIInterfaceOrientationMaskPortrait ;
}

- (BOOL)shouldAutorotate{
    return YES;
}




@end
