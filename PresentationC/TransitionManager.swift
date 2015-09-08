//
//  TransitionManager.swift
//  PresentationC
//
//  Created by VENKATA KURUVADA on 9/7/15.
//  Copyright © 2015 VENKATA KURUVADA. All rights reserved.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {

    private var isPresenting = false;
    var sourceController: UIViewController!;
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        if isPresenting {
            aminatePresentation(transitionContext);
        } else  {
            aminatedismissial(transitionContext);
        }
    }
    
    func aminatePresentation(transitionContext: UIViewControllerContextTransitioning) {
        
        let toViewC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey);
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey);
        let containerView = transitionContext.containerView();
        
        
        toView?.frame = transitionContext.finalFrameForViewController(toViewC!)
        toView?.center.x += (containerView?.bounds.size.width)!;
        
        containerView?.addSubview(toView!)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            
            toView?.center.x -= (containerView?.bounds.size.width)!;
            }) { (completed) -> Void in
                transitionContext.completeTransition(completed)
        }
    }
    
    func aminatedismissial(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey);
        let containerView = transitionContext.containerView()!
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            fromView?.center.x += containerView.bounds.size.width;
            }) { (completed) -> Void in
                transitionContext.completeTransition(completed)
        }
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5;
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true;
        
        if presented == self.sourceController {
            return self;
        } else {
            return nil;
        }
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false;
        
        if dismissed == self.sourceController {
            return self;
        } else {
            return nil;
        }
    }
    
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        if presented == self.sourceController {
            return MessagePresentationController(presentedViewController: presented, presentingViewController: presenting);
        } else  {
            return nil;
        }

    }
    
    
}
