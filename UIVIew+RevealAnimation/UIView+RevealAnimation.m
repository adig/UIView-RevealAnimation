//
//  UIView+RevealAnimation.m
//  ReavealAnimationDemo
//
//  Created by Adrian Geana on 10/16/13.
//
//

#import <objc/runtime.h>
#import "UIView+RevealAnimation.h"

static void * RACompleteBlockKey;

@implementation UIView (RevealAnimation)

static NSString * const kRAAnimationKey = @"RA_revealAnimation";

-(void) RA_animateRevealWithDuration:(NSTimeInterval)duration {
    [self RA_animateRevealWithDuration:duration
                              maskType:RAMaskEllipse
                                 delay:0
                            startScale:0
                              endScale:1.0
                         completeBlock:nil];
}

-(void) RA_animateRevealWithDuration:(NSTimeInterval)duration
                            maskType:(RARevealMaskType)maskType
                               delay:(NSTimeInterval)delay
                          startScale:(CGFloat)startScale
                            endScale:(CGFloat)endScale
                    completeBlock:(RACompleteBlock)completeBlock {
    
    CAShapeLayer *mask = [self maskLayerWithType:maskType];
    self.layer.mask = mask;
    mask.position = CGPointMake(self.frame.size.width / 2,
                                self.frame.size.height / 2);
    mask.transform = CATransform3DMakeScale(startScale, startScale, 1.0);
    
    CABasicAnimation *animationX = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    animationX.fromValue = @(startScale);
    animationX.toValue = @(endScale);
    animationX.removedOnCompletion = NO;
    animationX.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *animationY = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animationY.fromValue = @(startScale);
    animationY.toValue = @(endScale);
    animationY.removedOnCompletion = NO;
    animationY.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = duration;
    group.animations = @[animationX, animationY];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.delegate = self;
    
    [mask addAnimation:group forKey:kRAAnimationKey];
}

-(CAShapeLayer *)maskLayerWithType:(RARevealMaskType)maskType {
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.bounds = self.bounds;
    CGPathRef path;
    if(maskType == RAMaskRectangle) {
        path = CGPathCreateWithRect(self.bounds, NULL);
    } else {
        path = CGPathCreateWithEllipseInRect(self.bounds, NULL);
    }
    maskLayer.path = path;
    CGPathRelease(path);
    return maskLayer;
}

#pragma mark block setters & getters

-(void)setCompleteBlock:(RACompleteBlock)completeBlock {
    objc_setAssociatedObject(self,
                             RACompleteBlockKey,
                             completeBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(RACompleteBlock)completeBlock {
    return objc_getAssociatedObject(self, RACompleteBlockKey);
}

#pragma mark CAAnimationDelegate

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if(anim == [self.layer.mask animationForKey:kRAAnimationKey]) {
        RACompleteBlock complete = [self completeBlock];
        if(complete) {
            complete(flag);
            [self setCompleteBlock:nil];
        }
    }
}

@end