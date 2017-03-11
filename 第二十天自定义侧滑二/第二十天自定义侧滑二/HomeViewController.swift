//
//  HomeViewController.swift
//  第二十天自定义侧滑二
//
//  Created by 霍驹 on 17/3/11.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var gestureRecognize : UIPanGestureRecognizer!
    
    var textLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        gestureRecognize = UIPanGestureRecognizer.init()
        self.view.addGestureRecognizer(gestureRecognize!)
        
        textLabel.frame = CGRect.init(x: 0, y: 0, width: 500*pix, height: 300*pix)
        textLabel.center = CGPoint.init(x: self.view.center.x, y: self.view.center.y)
        textLabel.textAlignment = .center
        textLabel.textColor = UIColor.orange
        textLabel.text = "Home VC"
        textLabel.font = UIFont.init(name: "PingFangSC-Light", size: 100*pix)
        self.view.addSubview(textLabel)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
