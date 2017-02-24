//
//  ViewController.swift
//  第十二动画污点
//
//  Created by 霍驹 on 17/2/24.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class ViewController: UIViewController , CAAnimationDelegate {

    var mask = CALayer()
    var bgImage = UIImageView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UIApplication.shared.isStatusBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)
        
        bgImage.image = #imageLiteral(resourceName: "screen")
        bgImage.frame = view.bounds
        view.addSubview(bgImage);
        
        mask.contents = UIImage.init(named: "twitter")?.cgImage
        mask.bounds = CGRect(x: 0, y: 0, width: 100, height: 81)
        mask.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        mask.position = CGPoint.init(x: bgImage.frame.size.width/2, y: bgImage.frame.size.width/2)
        
        bgImage.layer.mask = mask
        
        maskAnimation()
        
    }

    func maskAnimation(){
        let caKeyAnimation = CAKeyframeAnimation.init(keyPath: "bounds")
        caKeyAnimation.duration = 0.5
        caKeyAnimation.delegate = self
        //动画延迟时间
        caKeyAnimation.beginTime = CACurrentMediaTime() + 0.5
        caKeyAnimation.timingFunctions = [CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut),CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)];
        
        let firstBounds = NSValue.init(cgRect: mask.bounds)
        let secondBounds = NSValue.init(cgRect: CGRect.init(x: 0, y: 0, width: 90, height: 73))
        let finalBounds = NSValue.init(cgRect: CGRect.init(x: 0, y: 0, width: 1600, height: 1300))
        caKeyAnimation.values = [firstBounds , secondBounds , finalBounds]
        caKeyAnimation.keyTimes = [0 , 0.3 , 1];
//        caKeyAnimation.isRemovedOnCompletion  = true
        self.mask.add(caKeyAnimation, forKey: "bounds")
        
        
    
    }
         func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
            self.bgImage.layer.mask = nil
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

