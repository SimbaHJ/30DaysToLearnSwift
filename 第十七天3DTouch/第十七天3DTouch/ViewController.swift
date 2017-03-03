//
//  ViewController.swift
//  第十七天3DTouch
//
//  Created by 霍驹 on 17/3/3.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIViewControllerPreviewingDelegate {

    let touchBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
        
        touchBtn.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        touchBtn.center = self.view.center
        if (self.traitCollection.forceTouchCapability == .available) {
            self.registerForPreviewing(with: self, sourceView: touchBtn)
        }
        touchBtn.backgroundColor = UIColor.orange
        touchBtn.setTitle("3DTouchBtn", for: .normal)
        touchBtn.setTitleColor(UIColor.white, for: .normal)
        touchBtn.clipsToBounds = true
        touchBtn.layer.cornerRadius = 5
        touchBtn.adjustsImageWhenHighlighted = false
        touchBtn.titleLabel?.font = UIFont.init(name: "Avenir-Medium", size: 15)
        self.view.addSubview(touchBtn)
    }
    
    
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let detailVc = BtnDeTailViewController()
        detailVc.preferredContentSize = CGSize.init(width: 0, height: 0)
        //虚化范围
        previewingContext.sourceRect = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        return detailVc
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        print("123")
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

