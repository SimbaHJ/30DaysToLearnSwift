//
//  BtnDeTailViewController.swift
//  第十七天3DTouch
//
//  Created by 霍驹 on 17/3/3.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit
import Foundation
//
class BtnDeTailViewController: UIViewController  {
    
     let touchBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        touchBtn.frame = CGRect.init(x: 0, y: 0, width: 300, height: 300)
        touchBtn.center = self.view.center
        touchBtn.backgroundColor = UIColor.orange
        touchBtn.setTitle("3DTouchBtn", for: .normal)
        touchBtn.setTitleColor(UIColor.white, for: .normal)
        touchBtn.clipsToBounds = true
        touchBtn.layer.cornerRadius = 15
        touchBtn.titleLabel?.font = UIFont.init(name: "Avenir-Medium", size: 45)
        self.view.addSubview(touchBtn)
        // Do any additional setup after loading the view.
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    override func previewActionItems() -> [UIPreviewActionItem] {
//        //
//        let action1 = UIPreviewAction(title: "点赞", style: .default) { (action, previewViewController) in
//            //
//        }
//        let action2 = UIPreviewAction(title: "评论", style: .default) { (action, previewViewController) in
//            //
//        }
//        let action3 = UIPreviewAction(title: "嘿嘿", style: .default) { (action, previewViewController) in
//            //
//        }
//        let action4 = UIPreviewAction(title: "呵呵", style: .default) { (action, previewViewController) in
//            //
//        }
//        let actionItems = [action1,action2,action3,action4]
//        return actionItems
//        
//    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
