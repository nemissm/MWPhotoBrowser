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

// UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [MWZoomingTransitionAnimator new];
}

@end
