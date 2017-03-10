//
//  ViewController.swift
//  第十九天自定义侧滑(一)
//
//  Created by 霍驹 on 17/3/9.
//  Copyright © 2017年 霍驹. All rights reserved.
//

/*
    此代码并非原创  在计算上 进行了修改
    来自岁寒大神博客  https://lvwenhan.com/ios/445.html
           github  https://github.com/johnlui/SwiftSideslipLikeQQ
 
*/

import UIKit

class ViewController: UIViewController {

    var homeViewController : HomeViewController?
    //homeVC 中心点相对自己中心的相对距离
    var homeViewCenterX : CGFloat = 0.0
    //右视图距左边占屏比
    let leftDistance : CGFloat = 0.78
    //右视图的高度占屏比
    let Proportion : CGFloat = 0.77
    //手势的灵敏度  高 <- 1 -> 低  1为正常
    let delicacy : CGFloat = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        homeViewController?.gestureRecognize.addTarget(self, action: #selector(pan))
    }
    
    func pan (recongnizer : UIPanGestureRecognizer){
        //手势移动的相对距离
        let x = recongnizer.translation(in: self.view).x
        //实际距离
        let distance = homeViewCenterX + x/delicacy
        print(distance)
        
        //手势结束时 根据范围 自动执行后续动画
        if recongnizer.state == .ended {
            if distance > WIDTH * (Proportion / 3) {
                showLeft()
            }else if distance < WIDTH * -(Proportion / 3){
                showRight()
            }else {
                showHome()
            }
            
            return
        }
        //计算缩放比例
        var scaling : CGFloat = homeViewController!.view.frame.origin.x >= 0.0 ? -1 : 1
        /*
           手指实际滑动距离(屏幕宽度百分比)  0  到  (leftDistance + Proportion/2) - 0.5
           缩放比例   1 到  Proportion
         */
        scaling *= distance/WIDTH
        scaling *= 1 - Proportion
        //等式后边的值为用户手势实际滑动距离/屏幕宽度
        scaling /= ((leftDistance + Proportion/2) - 0.5)
        scaling += 1
        //比例到最小时 停止缩放
        if scaling <= Proportion {
            return
        }
        //执行缩放和平移动画
        recongnizer.view?.transform = CGAffineTransform.identity.scaledBy(x: scaling, y: scaling)
        recongnizer.view?.center = CGPoint.init(x: self.view.center.x + distance, y: self.view.center.y)
        
    }
    
    func showLeft () {
        homeViewCenterX = WIDTH * (Proportion/2 + leftDistance - 0.5)
        doAnimation(proportion: Proportion)
    }
    
    func showRight () {
        homeViewCenterX = WIDTH * (0.5 - Proportion/2 - leftDistance)
        doAnimation(proportion: Proportion)
    }
    
    func showHome () {
        homeViewCenterX = 0
        doAnimation(proportion: 1)
    }
    
    //执行动画
    func doAnimation(proportion:CGFloat){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.homeViewController?.view.transform = CGAffineTransform.identity.scaledBy(x: proportion, y: proportion)
            self.homeViewController?.view.center = CGPoint.init(x: self.view.center.x + self.homeViewCenterX, y: self.view.center.y)
        }, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

