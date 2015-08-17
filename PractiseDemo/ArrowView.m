//
//  ArrowView.m
//
//  Code generated using QuartzCode 1.32.1 on 15/8/2.
//  www.quartzcodeapp.com
//

#import "ArrowView.h"
#import "QCMethod.h"

@interface ArrowView ()

@property (nonatomic, strong) NSMutableDictionary * layers;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;


@end

@implementation ArrowView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setupProperties];
		[self setupLayers];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self setupProperties];
		[self setupLayers];
	}
	return self;
}

- (void)setFrame:(CGRect)frame{
	[super setFrame:frame];
	[self setupLayerFrames];
}

- (void)setBounds:(CGRect)bounds{
	[super setBounds:bounds];
	[self setupLayerFrames];
}

- (void)setupProperties{
	self.completionBlocks = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsOpaqueMemory valueOptions:NSPointerFunctionsStrongMemory];;
	self.layers = [NSMutableDictionary dictionary];
	
}

- (void)setupLayers{
	CALayer * Group = [CALayer layer];
	[self.layer addSublayer:Group];
	
	self.layers[@"Group"] = Group;
	{
		CAShapeLayer * VerticalLine = [CAShapeLayer layer];
		[Group addSublayer:VerticalLine];
		VerticalLine.lineCap     = kCALineCapRound;
		VerticalLine.fillColor   = nil;
		VerticalLine.strokeColor = [UIColor blackColor].CGColor;
		VerticalLine.lineWidth   = 4;
		self.layers[@"VerticalLine"] = VerticalLine;
		CAShapeLayer * ArrowRight = [CAShapeLayer layer];
		[Group addSublayer:ArrowRight];
		[ArrowRight setValue:@(45 * M_PI/180) forKeyPath:@"transform.rotation"];
		ArrowRight.lineCap     = kCALineCapRound;
		ArrowRight.fillColor   = nil;
		ArrowRight.strokeColor = [UIColor blackColor].CGColor;
		ArrowRight.lineWidth   = 4;
		self.layers[@"ArrowRight"] = ArrowRight;
		CAShapeLayer * ArrowLeft = [CAShapeLayer layer];
		[Group addSublayer:ArrowLeft];
		[ArrowLeft setValue:@(-45 * M_PI/180) forKeyPath:@"transform.rotation"];
		ArrowLeft.lineCap     = kCALineCapRound;
		ArrowLeft.fillColor   = nil;
		ArrowLeft.strokeColor = [UIColor blackColor].CGColor;
		ArrowLeft.lineWidth   = 4;
		self.layers[@"ArrowLeft"] = ArrowLeft;
	}
	
	
	[self setupLayerFrames];
}

- (void)setupLayerFrames{
	CALayer * Group             = self.layers[@"Group"];
	Group.frame                 = CGRectMake(0.49783 * CGRectGetWidth(Group.superlayer.bounds), -0.11599 * CGRectGetHeight(Group.superlayer.bounds), 0.0125 * CGRectGetWidth(Group.superlayer.bounds), 0.95549 * CGRectGetHeight(Group.superlayer.bounds));
	
	CAShapeLayer * VerticalLine = self.layers[@"VerticalLine"];
	VerticalLine.frame          = CGRectMake(0, 0, 1 * CGRectGetWidth(VerticalLine.superlayer.bounds), 0.65795 * CGRectGetHeight(VerticalLine.superlayer.bounds));
	VerticalLine.path           = [self VerticalLinePathWithBounds:[self.layers[@"VerticalLine"] bounds]].CGPath;
	
	CAShapeLayer * ArrowRight   = self.layers[@"ArrowRight"];
	[ArrowRight setValue:@(0) forKeyPath:@"transform.rotation"];
	ArrowRight.frame            = CGRectMake(0, 0.34205 * CGRectGetHeight(ArrowRight.superlayer.bounds), 1 * CGRectGetWidth(ArrowRight.superlayer.bounds), 0.65795 * CGRectGetHeight(ArrowRight.superlayer.bounds));
	[ArrowRight setValue:@(45 * M_PI/180) forKeyPath:@"transform.rotation"];
	ArrowRight.path             = [self ArrowRightPathWithBounds:[self.layers[@"ArrowRight"] bounds]].CGPath;
	
	CAShapeLayer * ArrowLeft    = self.layers[@"ArrowLeft"];
	[ArrowLeft setValue:@(0) forKeyPath:@"transform.rotation"];
	ArrowLeft.frame             = CGRectMake(0, 0.34045 * CGRectGetHeight(ArrowLeft.superlayer.bounds),  CGRectGetWidth(ArrowLeft.superlayer.bounds), 0.65795 * CGRectGetHeight(ArrowLeft.superlayer.bounds));
	[ArrowLeft setValue:@(-45 * M_PI/180) forKeyPath:@"transform.rotation"];
	ArrowLeft.path              = [self ArrowLeftPathWithBounds:[self.layers[@"ArrowLeft"] bounds]].CGPath;
	
}

#pragma mark - Animation Setup

- (void)addDisplayCloseAnimation{
	[self addDisplayCloseAnimationCompletionBlock:nil];
}

- (void)addDisplayCloseAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = 1;
		completionAnim.delegate = self;
		[completionAnim setValue:@"DisplayClose" forKey:@"animId"];
		[completionAnim setValue:@(NO) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"DisplayClose"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"DisplayClose"]];
	}
	
	NSString * fillMode = kCAFillModeForwards;
	
	CALayer * Group = self.layers[@"Group"];
	
	////Group animation
	CAKeyframeAnimation * GroupPositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	GroupPositionAnim.values   = @[[NSValue valueWithCGPoint:CGPointMake(0.50408 * CGRectGetWidth(Group.superlayer.bounds), 0.34149 * CGRectGetHeight(Group.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.50408 * CGRectGetWidth(Group.superlayer.bounds), 0.34149 * CGRectGetHeight(Group.superlayer.bounds))]];
	GroupPositionAnim.keyTimes = @[@0, @1];
	GroupPositionAnim.duration = 1;
	
	CAAnimationGroup * GroupDisplayCloseAnim = [QCMethod groupAnimations:@[GroupPositionAnim] fillMode:fillMode];
	[self.layers[@"Group"] addAnimation:GroupDisplayCloseAnim forKey:@"GroupDisplayCloseAnim"];
	
	////VerticalLine animation
	CAKeyframeAnimation * VerticalLineHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
	VerticalLineHiddenAnim.values   = @[@YES, @YES];
	VerticalLineHiddenAnim.keyTimes = @[@0, @1];
	VerticalLineHiddenAnim.duration = 1;
	
	////VerticalLine animation
	CAKeyframeAnimation * VerticalLineStrokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
	VerticalLineStrokeStartAnim.values   = @[@1, @1];
	VerticalLineStrokeStartAnim.keyTimes = @[@0, @1];
	VerticalLineStrokeStartAnim.duration = 1;
	
	CAAnimationGroup * VerticalLineDisplayCloseAnim = [QCMethod groupAnimations:@[VerticalLineHiddenAnim, VerticalLineStrokeStartAnim] fillMode:fillMode];
	[self.layers[@"VerticalLine"] addAnimation:VerticalLineDisplayCloseAnim forKey:@"VerticalLineDisplayCloseAnim"];
	
	////ArrowRight animation
	CAKeyframeAnimation * ArrowRightStrokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
	ArrowRightStrokeStartAnim.values   = @[@0, @0];
	ArrowRightStrokeStartAnim.keyTimes = @[@0, @1];
	ArrowRightStrokeStartAnim.duration = 1;
	
	////ArrowRight animation
	CAKeyframeAnimation * ArrowRightStrokeEndAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
	ArrowRightStrokeEndAnim.values   = @[@1, @1];
	ArrowRightStrokeEndAnim.keyTimes = @[@0, @1];
	ArrowRightStrokeEndAnim.duration = 1;
	
	CAShapeLayer * ArrowRight = self.layers[@"ArrowRight"];
	
	////ArrowRight animation
	CAKeyframeAnimation * ArrowRightTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	ArrowRightTransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(-45 * M_PI/180, 0, 0, -1)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-45 * M_PI/180, 0, 0, -1)]];
	ArrowRightTransformAnim.keyTimes = @[@0, @1];
	ArrowRightTransformAnim.duration = 1;
	
	CAAnimationGroup * ArrowRightDisplayCloseAnim = [QCMethod groupAnimations:@[ArrowRightStrokeStartAnim, ArrowRightStrokeEndAnim, ArrowRightTransformAnim] fillMode:fillMode];
	[self.layers[@"ArrowRight"] addAnimation:ArrowRightDisplayCloseAnim forKey:@"ArrowRightDisplayCloseAnim"];
	
	////ArrowLeft animation
	CAKeyframeAnimation * ArrowLeftStrokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
	ArrowLeftStrokeStartAnim.values   = @[@0, @0];
	ArrowLeftStrokeStartAnim.keyTimes = @[@0, @1];
	ArrowLeftStrokeStartAnim.duration = 1;
	
	////ArrowLeft animation
	CAKeyframeAnimation * ArrowLeftStrokeEndAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
	ArrowLeftStrokeEndAnim.values   = @[@1, @1];
	ArrowLeftStrokeEndAnim.keyTimes = @[@0, @1];
	ArrowLeftStrokeEndAnim.duration = 1;
	
	CAShapeLayer * ArrowLeft = self.layers[@"ArrowLeft"];
	
	////ArrowLeft animation
	CAKeyframeAnimation * ArrowLeftTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	ArrowLeftTransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 0, -1)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 0, -1)]];
	ArrowLeftTransformAnim.keyTimes = @[@0, @1];
	ArrowLeftTransformAnim.duration = 1;
	
	CAAnimationGroup * ArrowLeftDisplayCloseAnim = [QCMethod groupAnimations:@[ArrowLeftStrokeStartAnim, ArrowLeftStrokeEndAnim, ArrowLeftTransformAnim] fillMode:fillMode];
	[self.layers[@"ArrowLeft"] addAnimation:ArrowLeftDisplayCloseAnim forKey:@"ArrowLeftDisplayCloseAnim"];
}

- (void)addCloseToArrowAnimation{
	[self addCloseToArrowAnimationCompletionBlock:nil];
}

- (void)addCloseToArrowAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	[self addCloseToArrowAnimationReverse:NO completionBlock:completionBlock];
}

- (void)addCloseToArrowAnimationReverse:(BOOL)reverseAnimation completionBlock:(void (^)(BOOL finished))completionBlock{
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = 0.295;
		completionAnim.delegate = self;
		[completionAnim setValue:@"CloseToArrow" forKey:@"animId"];
		[completionAnim setValue:@(NO) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"CloseToArrow"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"CloseToArrow"]];
	}
	
	NSString * fillMode = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards;
	
	CFTimeInterval totalDuration = 0.295;
	
	CALayer * Group = self.layers[@"Group"];
	
	////Group animation
	CAKeyframeAnimation * GroupPositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	GroupPositionAnim.values   = @[[NSValue valueWithCGPoint:CGPointMake(0.50408 * CGRectGetWidth(Group.superlayer.bounds), 0.34149 * CGRectGetHeight(Group.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.50408 * CGRectGetWidth(Group.superlayer.bounds), 0.6625 * CGRectGetHeight(Group.superlayer.bounds))]];
	GroupPositionAnim.keyTimes = @[@0, @1];
	GroupPositionAnim.duration = 0.295;
	
	CAAnimationGroup * GroupCloseToArrowAnim = [QCMethod groupAnimations:@[GroupPositionAnim] fillMode:fillMode];
	if (reverseAnimation) GroupCloseToArrowAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:GroupCloseToArrowAnim totalDuration:totalDuration];
	[self.layers[@"Group"] addAnimation:GroupCloseToArrowAnim forKey:@"GroupCloseToArrowAnim"];
	
	////VerticalLine animation
	CAKeyframeAnimation * VerticalLineHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
	VerticalLineHiddenAnim.values   = @[@NO, @NO];
	VerticalLineHiddenAnim.keyTimes = @[@0, @1];
	VerticalLineHiddenAnim.duration = 0.295;
	
	////VerticalLine animation
	CAKeyframeAnimation * VerticalLineStrokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
	VerticalLineStrokeStartAnim.values   = @[@1, @0];
	VerticalLineStrokeStartAnim.keyTimes = @[@0, @1];
	VerticalLineStrokeStartAnim.duration = 0.295;
	
	CAAnimationGroup * VerticalLineCloseToArrowAnim = [QCMethod groupAnimations:@[VerticalLineHiddenAnim, VerticalLineStrokeStartAnim] fillMode:fillMode];
	if (reverseAnimation) VerticalLineCloseToArrowAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:VerticalLineCloseToArrowAnim totalDuration:totalDuration];
	[self.layers[@"VerticalLine"] addAnimation:VerticalLineCloseToArrowAnim forKey:@"VerticalLineCloseToArrowAnim"];
	
	////ArrowRight animation
	CAKeyframeAnimation * ArrowRightStrokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
	ArrowRightStrokeStartAnim.values   = @[@0, @0];
	ArrowRightStrokeStartAnim.keyTimes = @[@0, @1];
	ArrowRightStrokeStartAnim.duration = 0.295;
	
	////ArrowRight animation
	CAKeyframeAnimation * ArrowRightStrokeEndAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
	ArrowRightStrokeEndAnim.values   = @[@1, @0.5];
	ArrowRightStrokeEndAnim.keyTimes = @[@0, @1];
	ArrowRightStrokeEndAnim.duration = 0.295;
	
	CAShapeLayer * ArrowRight = self.layers[@"ArrowRight"];
	
	////ArrowRight animation
	CAKeyframeAnimation * ArrowRightTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	ArrowRightTransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(-45 * M_PI/180, 0, 0, -1)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-45 * M_PI/180, 0, 0, -1)]];
	ArrowRightTransformAnim.keyTimes = @[@0, @1];
	ArrowRightTransformAnim.duration = 0.295;
	
	CAAnimationGroup * ArrowRightCloseToArrowAnim = [QCMethod groupAnimations:@[ArrowRightStrokeStartAnim, ArrowRightStrokeEndAnim, ArrowRightTransformAnim] fillMode:fillMode];
	if (reverseAnimation) ArrowRightCloseToArrowAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:ArrowRightCloseToArrowAnim totalDuration:totalDuration];
	[self.layers[@"ArrowRight"] addAnimation:ArrowRightCloseToArrowAnim forKey:@"ArrowRightCloseToArrowAnim"];
	
	////ArrowLeft animation
	CAKeyframeAnimation * ArrowLeftStrokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
	ArrowLeftStrokeStartAnim.values   = @[@0, @0];
	ArrowLeftStrokeStartAnim.keyTimes = @[@0, @1];
	ArrowLeftStrokeStartAnim.duration = 0.295;
	
	////ArrowLeft animation
	CAKeyframeAnimation * ArrowLeftStrokeEndAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
	ArrowLeftStrokeEndAnim.values   = @[@1, @0.5];
	ArrowLeftStrokeEndAnim.keyTimes = @[@0, @1];
	ArrowLeftStrokeEndAnim.duration = 0.295;
	
	CAShapeLayer * ArrowLeft = self.layers[@"ArrowLeft"];
	
	////ArrowLeft animation
	CAKeyframeAnimation * ArrowLeftTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	ArrowLeftTransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 0, -1)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 0, -1)]];
	ArrowLeftTransformAnim.keyTimes = @[@0, @1];
	ArrowLeftTransformAnim.duration = 0.295;
	
	CAAnimationGroup * ArrowLeftCloseToArrowAnim = [QCMethod groupAnimations:@[ArrowLeftStrokeStartAnim, ArrowLeftStrokeEndAnim, ArrowLeftTransformAnim] fillMode:fillMode];
	if (reverseAnimation) ArrowLeftCloseToArrowAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:ArrowLeftCloseToArrowAnim totalDuration:totalDuration];
	[self.layers[@"ArrowLeft"] addAnimation:ArrowLeftCloseToArrowAnim forKey:@"ArrowLeftCloseToArrowAnim"];
}

- (void)addCloseToFailAnimation{
	[self addCloseToFailAnimationCompletionBlock:nil];
}

- (void)addCloseToFailAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	[self addCloseToFailAnimationReverse:NO completionBlock:completionBlock];
}

- (void)addCloseToFailAnimationReverse:(BOOL)reverseAnimation completionBlock:(void (^)(BOOL finished))completionBlock{
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = 0.296;
		completionAnim.delegate = self;
		[completionAnim setValue:@"CloseToFail" forKey:@"animId"];
		[completionAnim setValue:@(NO) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"CloseToFail"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"CloseToFail"]];
	}
	
	NSString * fillMode = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards;
	
	CFTimeInterval totalDuration = 0.296;
	
	CALayer * Group = self.layers[@"Group"];
	
	////Group animation
	CAKeyframeAnimation * GroupPositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	GroupPositionAnim.values   = @[[NSValue valueWithCGPoint:CGPointMake(0.50408 * CGRectGetWidth(Group.superlayer.bounds), 0.34149 * CGRectGetHeight(Group.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.50408 * CGRectGetWidth(Group.superlayer.bounds), 0.34149 * CGRectGetHeight(Group.superlayer.bounds))]];
	GroupPositionAnim.keyTimes = @[@0, @1];
	GroupPositionAnim.duration = 0.159;
	
	CAAnimationGroup * GroupCloseToFailAnim = [QCMethod groupAnimations:@[GroupPositionAnim] fillMode:fillMode];
	if (reverseAnimation) GroupCloseToFailAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:GroupCloseToFailAnim totalDuration:totalDuration];
	[self.layers[@"Group"] addAnimation:GroupCloseToFailAnim forKey:@"GroupCloseToFailAnim"];
	
	////VerticalLine animation
	CAKeyframeAnimation * VerticalLineHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
	VerticalLineHiddenAnim.values   = @[@YES, @YES];
	VerticalLineHiddenAnim.keyTimes = @[@0, @1];
	VerticalLineHiddenAnim.duration = 0.159;
	
	////VerticalLine animation
	CAKeyframeAnimation * VerticalLineStrokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
	VerticalLineStrokeStartAnim.values   = @[@1, @1];
	VerticalLineStrokeStartAnim.keyTimes = @[@0, @1];
	VerticalLineStrokeStartAnim.duration = 0.159;
	
	CAAnimationGroup * VerticalLineCloseToFailAnim = [QCMethod groupAnimations:@[VerticalLineHiddenAnim, VerticalLineStrokeStartAnim] fillMode:fillMode];
	if (reverseAnimation) VerticalLineCloseToFailAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:VerticalLineCloseToFailAnim totalDuration:totalDuration];
	[self.layers[@"VerticalLine"] addAnimation:VerticalLineCloseToFailAnim forKey:@"VerticalLineCloseToFailAnim"];
	
	////ArrowRight animation
	CAKeyframeAnimation * ArrowRightStrokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
	ArrowRightStrokeStartAnim.values   = @[@0, @0, @0.1];
	ArrowRightStrokeStartAnim.keyTimes = @[@0, @0.535, @1];
	ArrowRightStrokeStartAnim.duration = 0.296;
	
	////ArrowRight animation
	CAKeyframeAnimation * ArrowRightStrokeEndAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
	ArrowRightStrokeEndAnim.values   = @[@1, @1, @0.8, @0.6];
	ArrowRightStrokeEndAnim.keyTimes = @[@0, @0.535, @0.671, @1];
	ArrowRightStrokeEndAnim.duration = 0.296;
	
	CAShapeLayer * ArrowRight = self.layers[@"ArrowRight"];
	
	////ArrowRight animation
	CAKeyframeAnimation * ArrowRightTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
	ArrowRightTransformAnim.values   = @[@(45 * M_PI/180), 
		 @(0), 
		 @(0)];
	ArrowRightTransformAnim.keyTimes = @[@0, @0.535, @1];
	ArrowRightTransformAnim.duration = 0.296;
	
	CAAnimationGroup * ArrowRightCloseToFailAnim = [QCMethod groupAnimations:@[ArrowRightStrokeStartAnim, ArrowRightStrokeEndAnim, ArrowRightTransformAnim] fillMode:fillMode];
	if (reverseAnimation) ArrowRightCloseToFailAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:ArrowRightCloseToFailAnim totalDuration:totalDuration];
	[self.layers[@"ArrowRight"] addAnimation:ArrowRightCloseToFailAnim forKey:@"ArrowRightCloseToFailAnim"];
	
	////ArrowLeft animation
	CAKeyframeAnimation * ArrowLeftStrokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
	ArrowLeftStrokeStartAnim.values   = @[@0, @0, @0.7, @0.8];
	ArrowLeftStrokeStartAnim.keyTimes = @[@0, @0.535, @0.671, @1];
	ArrowLeftStrokeStartAnim.duration = 0.296;
	
	////ArrowLeft animation
	CAKeyframeAnimation * ArrowLeftStrokeEndAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
	ArrowLeftStrokeEndAnim.values   = @[@1, @1, @0.8];
	ArrowLeftStrokeEndAnim.keyTimes = @[@0, @0.535, @1];
	ArrowLeftStrokeEndAnim.duration = 0.296;
	
	CAShapeLayer * ArrowLeft = self.layers[@"ArrowLeft"];
	
	////ArrowLeft animation
	CAKeyframeAnimation * ArrowLeftTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
	ArrowLeftTransformAnim.values   = @[@(-45 * M_PI/180), 
		 @(0), 
		 @(0)];
	ArrowLeftTransformAnim.keyTimes = @[@0, @0.535, @1];
	ArrowLeftTransformAnim.duration = 0.296;
	
	CAAnimationGroup * ArrowLeftCloseToFailAnim = [QCMethod groupAnimations:@[ArrowLeftStrokeStartAnim, ArrowLeftStrokeEndAnim, ArrowLeftTransformAnim] fillMode:fillMode];
	if (reverseAnimation) ArrowLeftCloseToFailAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:ArrowLeftCloseToFailAnim totalDuration:totalDuration];
	[self.layers[@"ArrowLeft"] addAnimation:ArrowLeftCloseToFailAnim forKey:@"ArrowLeftCloseToFailAnim"];
}

#pragma mark - Animation Cleanup

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
	void (^completionBlock)(BOOL) = [self.completionBlocks objectForKey:anim];;
	if (completionBlock){
		[self.completionBlocks removeObjectForKey:anim];
		if ((flag && self.updateLayerValueForCompletedAnimation) || [[anim valueForKey:@"needEndAnim"] boolValue]){
			[self updateLayerValuesForAnimationId:[anim valueForKey:@"animId"]];
			[self removeAnimationsForAnimationId:[anim valueForKey:@"animId"]];
		}
		completionBlock(flag);
	}
}

- (void)updateLayerValuesForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"DisplayClose"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"Group"] animationForKey:@"GroupDisplayCloseAnim"] theLayer:self.layers[@"Group"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"VerticalLine"] animationForKey:@"VerticalLineDisplayCloseAnim"] theLayer:self.layers[@"VerticalLine"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"ArrowRight"] animationForKey:@"ArrowRightDisplayCloseAnim"] theLayer:self.layers[@"ArrowRight"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"ArrowLeft"] animationForKey:@"ArrowLeftDisplayCloseAnim"] theLayer:self.layers[@"ArrowLeft"]];
	}
	else if([identifier isEqualToString:@"CloseToArrow"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"Group"] animationForKey:@"GroupCloseToArrowAnim"] theLayer:self.layers[@"Group"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"VerticalLine"] animationForKey:@"VerticalLineCloseToArrowAnim"] theLayer:self.layers[@"VerticalLine"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"ArrowRight"] animationForKey:@"ArrowRightCloseToArrowAnim"] theLayer:self.layers[@"ArrowRight"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"ArrowLeft"] animationForKey:@"ArrowLeftCloseToArrowAnim"] theLayer:self.layers[@"ArrowLeft"]];
	}
	else if([identifier isEqualToString:@"CloseToFail"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"Group"] animationForKey:@"GroupCloseToFailAnim"] theLayer:self.layers[@"Group"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"VerticalLine"] animationForKey:@"VerticalLineCloseToFailAnim"] theLayer:self.layers[@"VerticalLine"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"ArrowRight"] animationForKey:@"ArrowRightCloseToFailAnim"] theLayer:self.layers[@"ArrowRight"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"ArrowLeft"] animationForKey:@"ArrowLeftCloseToFailAnim"] theLayer:self.layers[@"ArrowLeft"]];
	}
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"DisplayClose"]){
		[self.layers[@"Group"] removeAnimationForKey:@"GroupDisplayCloseAnim"];
		[self.layers[@"VerticalLine"] removeAnimationForKey:@"VerticalLineDisplayCloseAnim"];
		[self.layers[@"ArrowRight"] removeAnimationForKey:@"ArrowRightDisplayCloseAnim"];
		[self.layers[@"ArrowLeft"] removeAnimationForKey:@"ArrowLeftDisplayCloseAnim"];
	}
	else if([identifier isEqualToString:@"CloseToArrow"]){
		[self.layers[@"Group"] removeAnimationForKey:@"GroupCloseToArrowAnim"];
		[self.layers[@"VerticalLine"] removeAnimationForKey:@"VerticalLineCloseToArrowAnim"];
		[self.layers[@"ArrowRight"] removeAnimationForKey:@"ArrowRightCloseToArrowAnim"];
		[self.layers[@"ArrowLeft"] removeAnimationForKey:@"ArrowLeftCloseToArrowAnim"];
	}
	else if([identifier isEqualToString:@"CloseToFail"]){
		[self.layers[@"Group"] removeAnimationForKey:@"GroupCloseToFailAnim"];
		[self.layers[@"VerticalLine"] removeAnimationForKey:@"VerticalLineCloseToFailAnim"];
		[self.layers[@"ArrowRight"] removeAnimationForKey:@"ArrowRightCloseToFailAnim"];
		[self.layers[@"ArrowLeft"] removeAnimationForKey:@"ArrowLeftCloseToFailAnim"];
	}
}

#pragma mark - Bezier Path

- (UIBezierPath*)VerticalLinePathWithBounds:(CGRect)bound{
	UIBezierPath *VerticalLinePath = [UIBezierPath bezierPath];
	CGFloat minX = CGRectGetMinX(bound), minY = CGRectGetMinY(bound), w = CGRectGetWidth(bound), h = CGRectGetHeight(bound);
	
	[VerticalLinePath moveToPoint:CGPointMake(minX + w, minY)];
	[VerticalLinePath addLineToPoint:CGPointMake(minX, minY + h)];
	
	return VerticalLinePath;
}

- (UIBezierPath*)ArrowRightPathWithBounds:(CGRect)bound{
	UIBezierPath *ArrowRightPath = [UIBezierPath bezierPath];
	CGFloat minX = CGRectGetMinX(bound), minY = CGRectGetMinY(bound), w = CGRectGetWidth(bound), h = CGRectGetHeight(bound);
	
	[ArrowRightPath moveToPoint:CGPointMake(minX + w, minY)];
	[ArrowRightPath addLineToPoint:CGPointMake(minX, minY + h)];
	
	return ArrowRightPath;
}

- (UIBezierPath*)ArrowLeftPathWithBounds:(CGRect)bound{
	UIBezierPath *ArrowLeftPath = [UIBezierPath bezierPath];
	CGFloat minX = CGRectGetMinX(bound), minY = CGRectGetMinY(bound), w = CGRectGetWidth(bound), h = CGRectGetHeight(bound);
	
	[ArrowLeftPath moveToPoint:CGPointMake(minX + w, minY)];
	[ArrowLeftPath addLineToPoint:CGPointMake(minX, minY + h)];
	
	return ArrowLeftPath;
}


@end