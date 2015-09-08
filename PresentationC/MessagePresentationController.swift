//
//  MessagePresentationController.swift
//  PresentationC
//
//  Created by VENKATA KURUVADA on 9/7/15.
//  Copyright © 2015 VENKATA KURUVADA. All rights reserved.
//

import UIKit

class MessagePresentationController: UIPresentationController {

    lazy var dimmingView:UIView = {
        let view = UIView(frame: self.containerView!.bounds);
        view.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        view.alpha = 0.0
        return view;
    }()
    

    /*
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController);
        
        let gesture = UITapGestureRecognizer(target: self.dimmingView, action: "onTouch:")
        
        self.dimmingView.addGestureRecognizer(gesture);
    } */
    
    func onTouch(gesture: UIGestureRecognizer) {
        
        if gesture.state == UIGestureRecognizerState.Ended {
            
            presentingViewController.dismissViewControllerAnimated(true, completion: nil);
        }
    }
    
    override func presentationTransitionWillBegin() {
        
        self.dimmingView.frame = (self.containerView?.bounds)!;
        self.dimmingView.alpha = 0.0;
        
        self.containerView?.addSubview(dimmingView);
        self.containerView?.addSubview(presentedView()!);
        
        if let transitioningCoordinates = self.presentingViewController.transitionCoordinator() {
            
            transitioningCoordinates.animateAlongsideTransition({ (context) -> Void in
                self.dimmingView.alpha = 1.0;
                }, completion: nil)
            
        } else  {
            self.dimmingView.alpha = 1.0;
        }
    }
    
    override func presentationTransitionDidEnd(completed: Bool) {
        
        if !completed {
            self.dimmingView.removeFromSuperview();
        }
    }
    
    override func dismissalTransitionWillBegin() {
        
        let transitionCoordinates = self.presentingViewController.transitionCoordinator();
        transitionCoordinates?.animateAlongsideTransition({ (context) -> Void in
            self.dimmingView.alpha = 0.0;
            }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(completed: Bool) {
        if completed {
            self.dimmingView.removeFromSuperview();
        }
    }
    
    /*
    override func frameOfPresentedViewInContainerView() -> CGRect {
        var frame = self.containerView?.bounds;
        
        frame = CGRectInset(frame!, 60.0, 100.0);
        
        return frame!;
    }*/
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        var presentedViewFrame = CGRectZero
        let containerBounds = containerView!.bounds
        presentedViewFrame.size = sizeForChildContentContainer(presentedViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.origin.x = containerBounds.size.width - presentedViewFrame.size.width
        
        return presentedViewFrame
    }
    
    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSizeMake(CGFloat((floorf(Float(parentSize.width / 2.0)))), parentSize.height)
    }
    
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator transitionCoordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: transitionCoordinator)
        
        transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
            self.dimmingView.frame = self.containerView!.bounds;
            }, completion:nil)
    }

    
    override func containerViewWillLayoutSubviews() {
        self.dimmingView.frame = (containerView?.bounds)!;
        presentedView()?.frame = frameOfPresentedViewInContainerView();
    }
    
    
}
