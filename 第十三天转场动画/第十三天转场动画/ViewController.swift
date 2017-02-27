//
//  ViewController.swift
//  第十三天转场动画
//
//  Created by 霍驹 on 17/2/27.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIViewControllerTransitioningDelegate {

    let menuManager = MenuTransitionManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isStatusBarHidden = true
        self.navigationController?.navigationBar.isHidden = true
        setUpUI()
    }
    func setUpUI(){
        let bgImageView = UIImageView.init(frame: self.view.frame)
        bgImageView.image = UIImage.init(named: "LaunchImage-800")
        view.addSubview(bgImageView)
        
        let tarImageView = UIImageView.init(frame: CGRect.init(x: 0, y: HEIGHT-100*pix, width: WIDTH, height: 100*pix))
        tarImageView.image = UIImage.init(named: "toolbar")
        tarImageView.isUserInteractionEnabled = true
        view.addSubview(tarImageView)
        
        let animationBtn = UIButton.init(frame: CGRect.init(x: 325*pix, y: 15*pix, width: 90*pix, height: 70*pix))
        animationBtn.setBackgroundImage(#imageLiteral(resourceName: "newPost"), for: .normal)
        animationBtn.addTarget(self, action: #selector(self.animationBtnTouch), for: .touchUpInside)
        tarImageView.addSubview(animationBtn)
        
        
    }
    
    func animationBtnTouch(){
        let menuVC = MenuViewController()
        self.present(menuVC, animated: true, completion: nil)
        
        
    }
    
    


}

