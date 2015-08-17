//
//  ArrowView.h
//
//  Code generated using QuartzCode 1.32.1 on 15/8/2.
//  www.quartzcodeapp.com
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ArrowView : UIView



- (void)addDisplayCloseAnimation;
- (void)addDisplayCloseAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addCloseToArrowAnimation;
- (void)addCloseToArrowAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addCloseToArrowAnimationReverse:(BOOL)reverseAnimation completionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addCloseToFailAnimation;
- (void)addCloseToFailAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addCloseToFailAnimationReverse:(BOOL)reverseAnimation completionBlock:(void (^)(BOOL finished))completionBlock;
- (void)removeAnimationsForAnimationId:(NSString *)identifier;

@end
