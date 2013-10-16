//
//  UIView+RevealAnimation.h
//  ReavealAnimationDemo
//
//  Created by Adrian Geana on 10/16/13.
//
//

#import <UIKit/UIKit.h>

typedef enum {
    RAMaskRectangle,
    RAMaskEllipse
} RARevealMaskType;

typedef void(^RACompleteBlock)(BOOL finished);

@interface UIView (RevealAnimation)

/* Convenience method to animate reveal on UIView with specified duration 
    default parameters are :
    @maskType = RAMaskEllipse
    @delay = 0
    @startScale = 0
    @endScale = 1.0
*/
-(void) RA_animateRevealWithDuration:(NSTimeInterval)duration;

/*
    Start reveal animation on view
    @duration - duration of animation
    @maskType - shape to use as mask used to reveal
    @delay - delay for anmation
    @startScale - scale for mask when animation starts (0.0 to 1.0)
    @endScale - scale for mask when animation finishes (0.0 to 1.0)
    @completeBlock - called when animation finishes
    Note: scale is handled relative to the UIView bounds
 */
-(void) RA_animateRevealWithDuration:(NSTimeInterval)duration
                            maskType:(RARevealMaskType)maskType
                               delay:(NSTimeInterval)delay
                          startScale:(CGFloat)startScale
                            endScale:(CGFloat)endScale
                       completeBlock:(RACompleteBlock)completeBlock;

@end
