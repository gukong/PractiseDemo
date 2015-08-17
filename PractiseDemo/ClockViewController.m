//
//  ClockViewController.m
//  PractiseDemo
//
//  Created by gukong on 15/7/12.
//  Copyright (c) 2015年 gukong. All rights reserved.
//

#import "ClockViewController.h"
#import "ClockView.h"

@interface ClockViewController ()

@property (nonatomic, strong) ClockView *clockView;

@end

@implementation ClockViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self setupViews];
}

- (void)setupViews {
    
    _clockView = [[ClockView alloc] initWithFrame:CGRectMake(0, 0, Width_V(self.view) - 50, Width_V(self.view) - 50)];
    [_clockView setCenter:CGPointMake(Width_V(self.view)/2, Height_V(self.view)/2)];
    [_clockView setBackgroundColor:[UIColor redColor]];
    [_clockView.layer setMasksToBounds:YES];
    [_clockView.layer setCornerRadius:5.f];
    [self.view addSubview:_clockView];
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
