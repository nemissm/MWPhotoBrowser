//
//  MWZoomingTransitionAnimator.m
//  Pods
//
//  Created by Mikhail Naryshkin on 02/02/17.
//
//

#import "MWZoomingTransitionAnimator.h"
#import "MWZoomingTransitionProtocol.h"
#import "MWPhotoBrowser.h"

@implementation MWZoomingTransitionAnimator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
//    // Dismiss
    //MWPhotoBrowser *photoBrowser = (MWPhotoBrowser*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    UIView *containerView = [transitionContext containerView];

    MWPhotoBrowser *photoBrowser = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];

    NSTimeInterval duration = [self transitionDuration:transitionContext];

    //UIView *panEndedViewSnapshot = [photoBrowser.zoomingView snapshotViewAfterScreenUpdates:NO];
    UIView *panEndedViewSnapshot = [photoBrowser.view resizableSnapshotViewFromRect:photoBrowser.contentRectForCurrentPageOnPanEnded
                                                                 afterScreenUpdates:NO
                                                                      withCapInsets:UIEdgeInsetsZero];
    panEndedViewSnapshot.frame = [containerView convertRect:photoBrowser.contentRectForCurrentPageOnPanEnded fromView:photoBrowser.view];
    // hide originals if needed

    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    [containerView insertSubview:toView belowSubview:fromView];
    [containerView addSubview:panEndedViewSnapshot];

    [UIView animateWithDuration:duration animations:^{
        // Fade out the source view controller
        fromView.alpha = 0.0;

        // Move the image view
        panEndedViewSnapshot.frame = [containerView convertRect:photoBrowser.zoomingView.frame fromView:photoBrowser.zoomingView.superview];
    } completion:^(BOOL finished) {
        NSLog(@"TransitionFromSecondToFirst completion");
        // Clean up
        [panEndedViewSnapshot removeFromSuperview];
//        fromViewController.imageView.hidden = NO;
//        cell.imageView.hidden = NO;

        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];


    // Get a snapshot of the image view
//    UIView *imageSnapshot = [fromViewController.imageView snapshotViewAfterScreenUpdates:NO];
//    imageSnapshot.frame = [containerView convertRect:fromViewController.imageView.frame fromView:fromViewController.imageView.superview];
//    fromViewController.imageView.hidden = YES;
//
//    // Get the cell we'll animate to
//    DSLThingCell *cell = [toViewController collectionViewCellForThing:fromViewController.thing];
//    cell.imageView.hidden = YES;
//
//    // Setup the initial view states
//    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
//    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
//    [containerView addSubview:imageSnapshot];
//
//    [UIView animateWithDuration:duration animations:^{
//        // Fade out the source view controller
//        fromViewController.view.alpha = 0.0;
//
//        // Move the image view
//        imageSnapshot.frame = [containerView convertRect:cell.imageView.frame fromView:cell.imageView.superview];
//    } completion:^(BOOL finished) {
//        NSLog(@"DSLTransitionFromSecondToFirst completion");
//        // Clean up
//        [imageSnapshot removeFromSuperview];
//        fromViewController.imageView.hidden = NO;
//        cell.imageView.hidden = NO;
//
//        // Declare that we've finished
//        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
//    }];
}

@end
