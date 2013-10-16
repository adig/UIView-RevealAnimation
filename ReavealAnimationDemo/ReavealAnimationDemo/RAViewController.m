//
//  RAViewController.m
//  ReavealAnimationDemo
//
//  Created by Adrian Geana on 10/16/13.
//
//

#import "RAViewController.h"
#import "UIView+RevealAnimation.h"

@implementation RAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                              0,
                                                              self.view.frame.size.width,
                                                              self.view.frame.size.height)];
    redView.backgroundColor = [UIColor redColor];
    [redView RA_animateRevealWithDuration:0.3
                                    maskType:RAMaskRectangle
                                    delay:0
                               startScale:0
                                 endScale:1
                            completeBlock:nil];
    [self.view addSubview:redView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
