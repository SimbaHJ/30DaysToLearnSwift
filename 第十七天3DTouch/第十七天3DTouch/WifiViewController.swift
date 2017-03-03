//
//  WifiViewController.swift
//  第十七天3DTouch
//
//  Created by 霍驹 on 17/3/3.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class WifiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 100))
        titleLabel.center = CGPoint.init(x: self.view.center.x, y: self.view.center.y)
        titleLabel.text = "Run VC"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.init(name: "Avenir-Medium", size: 30)
        self.view.addSubview(titleLabel)
        
        let imageView = UIImageView.init(frame: self.view.bounds)
        imageView.image = #imageLiteral(resourceName: "setting")
        self.view.addSubview(imageView)
        
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
