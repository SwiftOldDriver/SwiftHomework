//
//  TransitionManager.swift
//  TumblrMenu
//
//  Created by Mee Leo on 11/29/16.
//  Copyright © 2016 Mee Leo. All rights reserved.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    fileprivate var isMenuViewControllerPresenting = false
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let screens : (from: UIViewController, to: UIViewController) = (transitionContext.viewController(forKey: .from)!, transitionContext.viewController(forKey: .to)!)
        
        let menuViewController = !isMenuViewControllerPresenting ? screens.from as! MenuViewController : screens.to as! MenuViewController
        let bottomViewController = !isMenuViewControllerPresenting ? screens.to as UIViewController : screens.from as UIViewController
        let menuView = menuViewController.view!
        let bottomView = bottomViewController.view!
        
        if isMenuViewControllerPresenting {
            offStageMenuController(menuViewController)
        }
        
        container.addSubview(bottomView)
        container.addSubview(menuView)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: {
            if self.isMenuViewControllerPresenting {
                self.onStageMenuController(menuViewController)
            }else {
                self.offStageMenuController(menuViewController)
            }
        }, completion: { finished in
            transitionContext.completeTransition(true)
            UIApplication.shared.keyWindow!.addSubview(screens.to.view)
        })
    }
    
    func offStageMenuController(_ menuViewController: MenuViewController) {
        
        menuViewController.view.alpha = 0
        let topRowOffset  : CGFloat = 300
        let middleRowOffset : CGFloat = 150
        let bottomRowOffset  : CGFloat = 50
        let offsetArray = [topRowOffset, middleRowOffset, bottomRowOffset]
        
        for index in 0..<3{
            menuViewController.leftButtons[index].transform = CGAffineTransform(translationX: -offsetArray[index], y: 0)
            menuViewController.rightButtons[index].transform = CGAffineTransform(translationX: offsetArray[index], y: 0)
        }
    }
    
    func onStageMenuController(_ menuViewController: MenuViewController) {
        menuViewController.view.alpha = 1.0
        
        for index in 0..<3{
            menuViewController.leftButtons[index].transform = CGAffineTransform.identity
            menuViewController.rightButtons[index].transform = CGAffineTransform.identity
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isMenuViewControllerPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isMenuViewControllerPresenting = false
        return self
    }
    
}
