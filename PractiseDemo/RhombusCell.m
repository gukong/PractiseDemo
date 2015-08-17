//
//  RhombusCell.m
//  PractiseDemo
//
//  Created by gukong on 15/7/15.
//  Copyright (c) 2015年 gukong. All rights reserved.
//

#import "RhombusCell.h"

@interface RhombusCell ()

@property (nonatomic, strong) UIImageView *waveView;
@property (nonatomic, assign) CGFloat waveLenght;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation RhombusCell

- (void)dealloc {
    [_waveView.layer removeAllAnimations];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    _waveView = [[UIImageView alloc] init];
    [_waveView setImage:[UIImage imageNamed:@"fb_wave"]];
    [_waveView sizeToFit];
    [_waveView setFrame:CGRectMake(- (Width_V(_waveView) - Width_V(self)), Height_V(self)/2, Width_V(_waveView), Height_V(_waveView))];
    [_waveView setAlpha:0.8];
    [self addSubview:_waveView];
    
    _waveLenght = Width_V(_waveView)/3;
    
    [self animationForView:_waveView];
    
    _timeLabel = [[UILabel alloc] init];
    [_timeLabel setText:@"12:39:12"];
    [_timeLabel setFont:[UIFont systemFontOfSize:12.f]];
    [_timeLabel sizeToFit];
    [_timeLabel setCenter:CGPointMake(Width_V(self)/2, Height_V(self)/2)];
    [self addSubview:_timeLabel];
}

- (void)animationForView:(UIView *)aniView {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    [animation setFromValue:@(_waveView.center.x)];
    [animation setToValue:@(_waveView.center.x + _waveLenght * 2)];
    [animation setDuration:12.f];
    [animation setRemovedOnCompletion:YES];
    [animation setRepeatCount:CGFLOAT_MAX];
    [aniView.layer addAnimation:animation forKey:@"Rhombus"];
}

@end
