//
//  ViewController.swift
//  第九天视频背景
//
//  Created by 霍驹 on 17/2/21.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class ViewController: VideoBgViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        //设置
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
//        duration = 0.0
        contentURL = url
        view.isUserInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpUI() {
        let logoImage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 400*pix, height: 130*pix))
        logoImage.center = CGPoint.init(x: 375*pix, y: 300*pix)
        logoImage.image = UIImage.init(named: "login-secondary-logo")
        view.addSubview(logoImage)
        
        let loginBtn = UIButton.init(frame: CGRect.init(x: 40*pix, y: HEIGHT - 300*pix, width: WIDTH-80*pix, height: 80*pix))
        loginBtn.backgroundColor = UIColor.green
        loginBtn.setTitle("login", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.layer.cornerRadius = 3
        loginBtn.clipsToBounds = true
        view.addSubview(loginBtn)
        
        let signUpBtn = UIButton.init(frame: CGRect.init(x: 40*pix, y: HEIGHT - 180*pix, width: WIDTH-80*pix, height: 80*pix))
        signUpBtn.backgroundColor = UIColor.white
        signUpBtn.setTitle("login", for: .normal)
        signUpBtn.setTitleColor(UIColor.green, for: .normal)
        signUpBtn.layer.cornerRadius = 3
        signUpBtn.clipsToBounds = true
        view.addSubview(signUpBtn)
    }


}

