//
//  ViewController.m
//  PractiseDemo
//
//  Created by gukong on 15/7/9.
//  Copyright (c) 2015年 gukong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIAttachmentBehavior *attachmentBehavior;
@property (strong, nonatomic) IBOutlet UIView *square;
@property (strong, nonatomic) IBOutlet UIView *smallSquare;
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat currentAngle;

@property (nonatomic, assign) CGVector vector;
@property (nonatomic, strong) UIGravityBehavior *gravityBeahvior;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentAngle = 0.f;
    _vector = CGVectorMake(0, 1.f);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Do any additional setup after loading the view, typically from a nib.
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    _gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[self.square]];
    [_gravityBeahvior setGravityDirection:_vector];
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.square]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    _center = CGPointMake(self.square.center.x, self.square.center.y);
    CGPoint anchorPoint = [self pointWithCenter:_center radius:110 angle:0];
    [_square setCenter:_center];
    UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.square attachedToAnchor:anchorPoint];
    
    [attachmentBehavior setFrequency:3.5];
    [attachmentBehavior setDamping:10.];
    [animator addBehavior:attachmentBehavior];
    [animator addBehavior:_gravityBeahvior];
    [animator addBehavior:collisionBehavior];

    self.animator = animator;
    
    self.attachmentBehavior = attachmentBehavior;
}

- (CGPoint)pointWithCenter:(CGPoint)center radius:(CGFloat)radius angle:(CGFloat)angle {
    CGFloat x1 = center.x + radius*cosf(angle*M_PI/180);
    CGFloat y1 = center.y + radius*sinf(angle*M_PI/180);
    return CGPointMake(x1, y1);
}


@end
