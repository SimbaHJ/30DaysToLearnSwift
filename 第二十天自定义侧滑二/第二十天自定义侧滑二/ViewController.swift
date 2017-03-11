//
//  ViewController.swift
//  第二十天自定义侧滑二
//
//  Created by 霍驹 on 17/3/11.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView = UIView()
    
    var maskView = UIView()
    
    var tapGesture = UITapGestureRecognizer()
    
    var homeViewController : HomeViewController?
    
    var leftViewController : LeftViewController?
    
    var distanceOfLeftVC : CGFloat = 50.0
    
    var proportionOfleftVC : CGFloat = 1.0
    
    var centerOfLeftVC :CGPoint!
    
    
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
        
        addNavigationAndTabar()
        
        leftViewController?.cellDidSelect = {(title) in
            self.homeViewController?.textLabel.text = title
            self.showHome()
        }
        
        
        homeViewController?.gestureRecognize.addTarget(self, action: #selector(pan))
        tapGesture.addTarget(self, action: #selector(tap))
    }
    
    func tap () {
        showHome()
    }
    
    
    
    func pan (recongnizer : UIPanGestureRecognizer){
        //手势移动的相对距离
        let x = recongnizer.translation(in: self.view).x
        //实际距离
        let distance = homeViewCenterX + x/delicacy
        print(distance)
        
        let tureProprotion = distance / (((leftDistance + Proportion/2) - 0.5) * WIDTH)
        
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
        var scaling : CGFloat = mainView.frame.origin.x >= 0.0 ? -1 : 1
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
        
        //设置遮罩的透明度
        maskView.alpha = (scaling - Proportion)/(1-Proportion)        
        //执行缩放和平移动画
        mainView.transform = CGAffineTransform.identity.scaledBy(x: scaling, y: scaling)
        mainView.center = CGPoint.init(x: self.view.center.x + distance, y: self.view.center.y)
        
        
        //执行左视图动画
        let pro  = 0.8 + (proportionOfleftVC - 0.8) * tureProprotion
        
        leftViewController?.view.center = CGPoint.init(x: centerOfLeftVC.x + ((leftDistance * 0.2) * WIDTH - distanceOfLeftVC)*tureProprotion, y: centerOfLeftVC.y)
        leftViewController?.view.transform = CGAffineTransform.identity.scaledBy(x: pro, y: pro)
        
    }
    
    func showLeft () {
        mainView.addGestureRecognizer(tapGesture)
        homeViewCenterX = WIDTH * (Proportion/2 + leftDistance - 0.5)
        doAnimation(proportion: Proportion, show: "left")
    }
    
    func showRight () {
        mainView.addGestureRecognizer(tapGesture)
        homeViewCenterX = WIDTH * (0.5 - Proportion/2 - leftDistance)
        doAnimation(proportion: Proportion, show: "right")
    }
    
    func showHome () {
        mainView.removeGestureRecognizer(tapGesture)
        homeViewCenterX = 0
        doAnimation(proportion: 1, show: "home")
    }
    
    //执行动画
    func doAnimation(proportion:CGFloat , show : String){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.mainView.transform = CGAffineTransform.identity.scaledBy(x: proportion, y: proportion)
            self.mainView.center = CGPoint.init(x: self.view.center.x + self.homeViewCenterX, y: self.view.center.y)
            if show == "left"{
                self.leftViewController?.view.center = CGPoint.init(x: self.centerOfLeftVC.x + self.proportionOfleftVC, y: self.centerOfLeftVC.y)
                self.leftViewController?.view.transform = CGAffineTransform.identity.scaledBy(x: self.proportionOfleftVC, y: self.proportionOfleftVC)
                self.maskView.alpha = 0
            }else if show == "right"{
                self.leftViewController?.view.center = CGPoint.init(x: self.view.center.x-self.distanceOfLeftVC, y: self.view.center.y)
                self.leftViewController?.view.transform = CGAffineTransform.identity.scaledBy(x: 0.8, y: 0.8)
                self.maskView.alpha = 0
            }else{
                self.leftViewController?.view.center = CGPoint.init(x: self.view.center.x-self.distanceOfLeftVC, y: self.view.center.y)
                self.leftViewController?.view.transform = CGAffineTransform.identity.scaledBy(x: 0.8, y: 0.8)
                self.maskView.alpha = 1
            }
            self.leftViewController?.view.alpha = show == "right" ? 0 : 1
            
        }, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

