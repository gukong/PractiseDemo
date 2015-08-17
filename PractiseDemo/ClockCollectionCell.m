//
//  ClockCollectionCell.m
//  PractiseDemo
//
//  Created by gukong on 15/7/12.
//  Copyright (c) 2015年 gukong. All rights reserved.
//

#import "ClockCollectionCell.h"
#import "ClockView.h"

@interface ClockCollectionCell () {
    
}

@property (nonatomic, strong) UIView *listView;

@end

@implementation ClockCollectionCell

- (void)dealloc {
    [_clockView removeObserver:self forKeyPath:@"radian"];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    _listView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width_V(self) - 40, Height_V(self)-40)];
    [_listView setCenter:CGPointMake(Width_V(self)/2, Height_V(self)/2)];
    [_listView setBackgroundColor:[UIColor purpleColor]];
    [self addSubview:_listView];
}

- (void)setClockView:(ClockView *)clockView {
    _clockView = clockView;
    [_clockView addObserver:self forKeyPath:@"radian" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSNumber *value = [change objectForKey:@"new"];
    [_listView setTransform:CGAffineTransformMakeRotation(2 * M_PI - value.floatValue)];
}

@end
