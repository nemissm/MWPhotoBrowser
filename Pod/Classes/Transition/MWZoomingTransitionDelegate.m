//
//  MWZoomingTransitionDelegate.m
//  Pods
//
//  Created by Mikhail Naryshkin on 02/02/17.
//
//

#import "MWZoomingTransitionDelegate.h"
#import "MWZoomingTransitionAnimator.h"

@implementation MWZoomingTransitionDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                            presentingController:(UIViewController *)presenting
                                                                                sourceController:(UIViewController *)source {
    return [MWZoomingTransitionAnimator new];
}

// UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [MWZoomingTransitionAnimator new];
}

@end
