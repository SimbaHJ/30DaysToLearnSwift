//
//  ViewController(UI).swift
//  第十九天自定义侧滑(一)
//
//  Created by 霍驹 on 17/3/10.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

extension ViewController {
    
    func setUpUI(){
        //给主视图设置背景
        let bgImageView = UIImageView.init(frame: self.view.frame)
        bgImageView.image = #imageLiteral(resourceName: "IMG_0155.JPG")
        bgImageView.isUserInteractionEnabled = true
        self.view.addSubview(bgImageView)
        
        //添加HomeVc
        homeViewController = HomeViewController()
        self.view.addSubview((homeViewController?.view)!)
        
        
    }

}
