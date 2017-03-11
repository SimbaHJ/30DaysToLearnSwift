//
//  ViewController(UI).swift
//  第二十天自定义侧滑二
//
//  Created by 霍驹 on 17/3/11.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

extension ViewController {
    
    func setUpUI(){
        //给主视图设置背景
        let bgImageView = UIImageView.init(frame: self.view.frame)
        bgImageView.image = #imageLiteral(resourceName: "back")
        bgImageView.isUserInteractionEnabled = true
        self.view.addSubview(bgImageView)
        
        
        //添加HomeVc
        homeViewController = HomeViewController()
        mainView.addSubview((homeViewController?.view)!)
        
        //添加leftVc
        leftViewController = LeftViewController()
        leftViewController?.view.frame = CGRect.init(x: 0, y: 0, width: WIDTH*leftDistance, height: HEIGHT)
        leftViewController?.view.center = CGPoint.init(x: self.view.center.x-distanceOfLeftVC, y: self.view.center.y)
        leftViewController?.view.transform = CGAffineTransform.identity.scaledBy(x: 0.8, y: 0.8)
        centerOfLeftVC = leftViewController?.view.center
        self.view.addSubview((leftViewController?.view)!)
        
        maskView.frame = self.view.frame
        maskView.backgroundColor = UIColor.black
        self.view.addSubview(maskView)
        
        mainView.frame = self.view.frame
        self.view.addSubview(mainView)
    
    }
    
    func addNavigationAndTabar (){
        let nav = UINavigationController.init(rootViewController: homeViewController!)
        
        let leftBtn = UIButton.init(frame: CGRect.init(x: 40*pix, y: 10*pix, width: 40*pix, height: 40*pix))
        leftBtn.setBackgroundImage(#imageLiteral(resourceName: "qq"), for: .normal)
        leftBtn.addTarget(self, action: #selector(showLeft), for: .touchUpInside)
        let leftItem = UIBarButtonItem.init(customView: leftBtn)
        homeViewController?.navigationItem.leftBarButtonItem = leftItem
        
        let rightBtn = UIButton.init(frame: CGRect.init(x: 660*pix, y: 10*pix, width: 50*pix, height: 50*pix))
        rightBtn.setBackgroundImage(#imageLiteral(resourceName: "xingxing"), for: .normal)
        rightBtn.addTarget(self, action: #selector(showRight), for: .touchUpInside)
        let rightItem = UIBarButtonItem.init(customView: rightBtn)
        homeViewController?.navigationItem.rightBarButtonItem = rightItem
        
        
        homeViewController?.navigationController?.navigationBar.barTintColor = color(R: 0, G: 170, B: 238)
        mainView.isUserInteractionEnabled = true
        homeViewController?.view.isUserInteractionEnabled = true
        mainView.addSubview((homeViewController?.navigationController?.view)!)
    }
    
    
}
