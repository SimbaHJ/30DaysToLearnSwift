//
//  MenuTransitionManager.swift
//  第十三天转场动画
//
//  Created by 霍驹 on 17/2/27.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class MenuTransitionManager: NSObject ,
UIViewControllerAnimatedTransitioning ,UIViewControllerTransitioningDelegate  {

     var presenting = true
    
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let context = transitionContext.containerView
        let vcs : (formVc:UIViewController , toVc:UIViewController) = (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)! , transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!)
        let mainVc = self.presenting ? vcs.formVc as! ViewController : vcs.toVc as! ViewController
        let menuVc = self.presenting ? vcs.toVc as! MenuViewController : vcs.formVc as! MenuViewController
        
        let mainView = mainVc.view
        let menuView = menuVc.view
        
        if self.presenting {
            self.offSetController(menuViewController: menuVc)
        }
        
        context.addSubview(mainView!)
        context.addSubview(menuView!)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        
        
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: {
            if (self.presenting){
            self.onSetController(menuViewController: menuVc)
            }else{
            self.offSetController(menuViewController: menuVc)
            }
        }, completion: { finished in
            transitionContext.completeTransition(true)
            UIApplication.shared.keyWindow!.addSubview(vcs.toVc.view)
        })
        
    }
    
    func offstage(offNumber : CGFloat) -> CGAffineTransform {
        return CGAffineTransform.init(translationX: offNumber, y: 0)
    }
    
    
    func offSetController(menuViewController : MenuViewController)
    {
        menuViewController.view.alpha = 0;
        
        let topOffSet :CGFloat = 300
        let midOffSet :CGFloat = 150
        let bottomOffSet :CGFloat = 50
        
        menuViewController.textButton.transform = self.offstage(offNumber: -topOffSet)
        menuViewController.textLabel.transform = self.offstage(offNumber: -topOffSet)
        
        menuViewController.quoteButton.transform = self.offstage(offNumber: -midOffSet)
        menuViewController.quoteLabel.transform = self.offstage(offNumber: -midOffSet)
        
        menuViewController.chatButton.transform = self.offstage(offNumber: -bottomOffSet)
        menuViewController.chatLabel.transform = self.offstage(offNumber: -bottomOffSet)
        
        menuViewController.PhotoButton.transform = self.offstage(offNumber: topOffSet)
        menuViewController.PhotoButton.transform = self.offstage(offNumber: topOffSet)
        
        menuViewController.linkButton.transform = self.offstage(offNumber: midOffSet)
        menuViewController.linkLabel.transform = self.offstage(offNumber: midOffSet)
        
        menuViewController.audioButton.transform = self.offstage(offNumber: bottomOffSet)
        menuViewController.audioLabel.transform = self.offstage(offNumber: bottomOffSet)
        
        
        
    
    }
    
    func onSetController(menuViewController : MenuViewController)
    {
        menuViewController.view.alpha = 1
    
        menuViewController.textButton.transform = .identity
        menuViewController.textLabel.transform = .identity
        menuViewController.quoteButton.transform = .identity
        menuViewController.quoteLabel.transform = .identity
        menuViewController.chatButton.transform = .identity
        menuViewController.chatLabel.transform = .identity
        
        menuViewController.PhotoButton.transform = .identity
        menuViewController.PhotoButton.transform = .identity
        menuViewController.linkButton.transform = .identity
        menuViewController.linkLabel.transform = .identity
        
        menuViewController.audioButton.transform = .identity
        menuViewController.audioLabel.transform = .identity
    
    }
    
    
    
    
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
       return 1
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self;
    }
    
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self;
    }
    
    
    
    
    
    
    
    
}
