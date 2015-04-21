//
//  SlideInteractor.m
//  leftToRightAnimate
//
//  Created by Guilherme Martins on 4/21/15.
//  Copyright (c) 2015 com.gui.kenshuGame. All rights reserved.
//

#import "SlideInteractor.h"

@implementation SlideInteractor

const CGFloat PresentedViewWidthPortrait = 300.0f;

-(CGRect)rectForDismissedState:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromViewController;
    
    if (self.presenting)
        fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    else
        fromViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    return CGRectMake(-containerView.bounds.size.width, 0, PresentedViewWidthPortrait, containerView.bounds.size.height);
}

- (CGRect)rectForPresentedState:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromViewController;
    
    if (self.presenting)
        fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    else
        fromViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    return CGRectOffset([self rectForDismissedState:transitionContext], PresentedViewWidthPortrait, 0);

}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source{
    self.presenting = YES;
    return self;
}


- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.presenting = NO;
    return self;
}

- (void)animationEnded:(BOOL)transitionCompleted{
    // reset state
    self.presenting = NO;
}
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3f;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    NSLog(@"containerView frame=%@ bounds=%@", NSStringFromCGRect(containerView.frame), NSStringFromCGRect(containerView.bounds));
    
    if (self.presenting) {
        // set starting rect for animation
        toViewController.view.frame = [self rectForDismissedState:transitionContext];
        toViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [containerView addSubview:toViewController.view];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.frame = [self rectForPresentedState:transitionContext];
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    } else {
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.frame = [self rectForDismissedState:transitionContext];
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
            [fromViewController.view removeFromSuperview];
        }];
    }
}


@end
