//
//  ClockView.m
//  PractiseDemo
//
//  Created by gukong on 15/7/12.
//  Copyright (c) 2015年 gukong. All rights reserved.
//

#import "ClockView.h"
#import "ClockCollectionCell.h"

@interface ClockView()<UICollectionViewDataSource,UICollectionViewDelegate> {
    CGFloat interval;
    CGFloat currentAngle;
}

@property (nonatomic, strong) UICollectionView *clockCollectionView;
@property (nonatomic, strong) NSTimer *rotateTimer;

@end

#pragma mark - implementation

@implementation ClockView

- (void)dealloc {
    
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        interval = 5.f;
        currentAngle = 0.f;
        [self setupViews];
        [self setupTimer];
    }
    return self;
}

- (void)setupViews {
    [self setupCollectionView];
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake((Width_V(self)-interval) / 2, (Height_V(self)-interval)/2)];
    [flowLayout setMinimumInteritemSpacing:interval];
    [flowLayout setMinimumLineSpacing:interval];
    _clockCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    [_clockCollectionView registerClass:[ClockCollectionCell class] forCellWithReuseIdentifier:@"ClockCollectionCell"];
    [_clockCollectionView setDataSource:self];
    [_clockCollectionView setDelegate:self];
    [self addSubview:_clockCollectionView];
}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ClockCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ClockCollectionCell" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor yellowColor]];
    [cell setClockView:self];
    return cell;
}

#pragma mark - Timer

- (void)setupTimer {
    _rotateTimer = [NSTimer timerWithTimeInterval:1.f target:self selector:@selector(timefire:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_rotateTimer forMode:NSDefaultRunLoopMode];;
}

- (void)stopTimer {
    [_rotateTimer invalidate];
}

- (void)timefire:(NSTimer *)timer {
    [self willChangeValueForKey:@"radian"];
    self.radian = currentAngle*M_PI/180;
    [self didChangeValueForKey:@"radian"];
    [UIView animateWithDuration:0.1 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [_clockCollectionView setTransform:CGAffineTransformMakeRotation(_radian)];
    } completion:^(BOOL finished) {
        currentAngle += 1.f;
        if (currentAngle == 360.f) {
            currentAngle = 0.f;
        }
    }];
}

@end
