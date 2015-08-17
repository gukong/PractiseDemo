//
//  QuartzCodeViewController.m
//  PractiseDemo
//
//  Created by gukong on 15/8/2.
//  Copyright (c) 2015年 gukong. All rights reserved.
//

#import "QuartzCodeViewController.h"
#import "ArrowView.h"

@interface QuartzCodeViewController ()
{
    ArrowView *arrowView;
}
@end

@implementation QuartzCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrowView = [[ArrowView alloc] initWithFrame:CGRectMake(100, 200, 40, 40)];
    [arrowView setBackgroundColor:[UIColor redColor]];
    [arrowView addDisplayCloseAnimation];
    [self.view addSubview:arrowView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CloseToFail:(id)sender {
    [arrowView addCloseToFailAnimationCompletionBlock:^(BOOL finished) {
        
    }];
}
- (IBAction)ArrowToClose:(id)sender {
    [arrowView addCloseToArrowAnimationReverse:YES completionBlock:nil];
}
- (IBAction)CloseToArray:(id)sender {
    [arrowView addCloseToArrowAnimation];
}
- (IBAction)DisplayClose:(id)sender {
    [arrowView addDisplayCloseAnimation];
}
- (IBAction)FailToClose:(id)sender {
    [arrowView addCloseToFailAnimationReverse:YES completionBlock:nil];
}

@end
