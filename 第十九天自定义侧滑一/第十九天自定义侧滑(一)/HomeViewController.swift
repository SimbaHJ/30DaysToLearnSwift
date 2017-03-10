//
//  HomeViewController.swift
//  第十九天自定义侧滑(一)
//
//  Created by 霍驹 on 17/3/10.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var gestureRecognize : UIPanGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orange
        
        gestureRecognize = UIPanGestureRecognizer.init()
        self.view.addGestureRecognizer(gestureRecognize!)
        
        let textLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 500*pix, height: 300*pix))
        textLabel.center = CGPoint.init(x: self.view.center.x, y: self.view.center.y)
        textLabel.textAlignment = .center
        textLabel.textColor = UIColor.white
        textLabel.text = "Home VC"
        textLabel.font = UIFont.init(name: "PingFangSC-Light", size: 100*pix)
        self.view.addSubview(textLabel)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
