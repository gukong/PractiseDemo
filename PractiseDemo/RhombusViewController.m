//
//  RhombusViewController.m
//  PractiseDemo
//
//  Created by gukong on 15/7/15.
//  Copyright (c) 2015年 gukong. All rights reserved.
//

#import "RhombusViewController.h"
#import "RhombusViewLayout.h"
#import "RhombusCell.h"

@interface RhombusViewController ()<UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *rhombusCollection;

@end

@implementation RhombusViewController

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    RhombusViewLayout *viewlayout = [[RhombusViewLayout alloc] init];
    [viewlayout setItemSize:CGSizeMake(140.f, 140.f)];
    
    _rhombusCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, Width_V(self.view), Width_V(self.view))
                                            collectionViewLayout:viewlayout];
    [_rhombusCollection setBackgroundColor:[UIColor purpleColor]];
    [_rhombusCollection setDataSource:self];
    [_rhombusCollection registerClass:[RhombusCell class] forCellWithReuseIdentifier:@"RhombusCell"];
    [self.view addSubview:_rhombusCollection];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RhombusCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RhombusCell" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor greenColor]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red.png"]];
    [imageView setFrame:cell.bounds];
    [cell setMaskView:imageView];
    return cell;
}


@end
