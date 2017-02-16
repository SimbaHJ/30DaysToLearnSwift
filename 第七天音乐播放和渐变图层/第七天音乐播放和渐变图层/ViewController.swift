//
//  ViewController.swift
//  第七天音乐播放和渐变图层
//
//  Created by 霍驹 on 17/2/16.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var audioPlayer : AVAudioPlayer?
    var gradientLayer : CAGradientLayer?
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isStatusBarHidden = true
        setUpUI()
    }

    func setUpUI(){
        
        let blurEffect = UIBlurEffect.init(style: .light)
        let effectView = UIVisualEffectView.init(effect: blurEffect)
        effectView.frame = CGRect.init(x: 0, y: 0, width: WIGHT, height: HEGHT)
        let vibrancyEffect = UIVibrancyEffect.init()
        let vibrancyEffectView = UIVisualEffectView.init(effect: vibrancyEffect)
        vibrancyEffectView.frame = CGRect.init(x: 0, y: 0, width: WIGHT, height: HEGHT)
        effectView.contentView.addSubview(vibrancyEffectView)
        self.view.addSubview(effectView)
        
        let playBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 200*pix, height: 200*pix))
        playBtn.center = CGPoint.init(x: 375*pix, y: HEGHT/2)
        playBtn.setBackgroundImage(#imageLiteral(resourceName: "music play"), for: .normal)
        playBtn.addTarget(self, action: #selector(playBtnTouch), for: .touchUpInside)
        effectView.contentView.addSubview(playBtn)
//        self.view.addSubview(playBtn)
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerClick), userInfo: nil, repeats: true)
        }
        
        
        gradientLayer = CAGradientLayer.init()
        gradientLayer?.frame = CGRect.init(x: 0, y: 0, width:WIGHT , height: HEGHT)
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor(red: 1.0, green: 0.5, blue: 0, alpha: 0.4).cgColor as CGColor
        let color3 = UIColor(red: 0.3, green: 1, blue: 0, alpha: 0.3).cgColor as CGColor
        let color4 = UIColor(red: 0.4, green: 0, blue: 1, alpha: 0.3).cgColor as CGColor
        let color5 = UIColor(white: 0.4, alpha: 0.2).cgColor as CGColor
        gradientLayer?.colors = [color1, color2, color3, color4, color5]
        gradientLayer?.locations = [0.10, 0.20, 0.40, 0.70, 0.90]
        gradientLayer?.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer?.endPoint = CGPoint.init(x: 1, y: 1)
        self.view.layer.addSublayer(gradientLayer!)
        
        
        
        self.view.backgroundColor = UIColor.black
    }
    
    func timerClick(){
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
    }
    
    func playBtnTouch(){
        let bgMusic = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        
        do {
            //设置类别
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            //设置静音状态下播放
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer.init(contentsOf: bgMusic)
            //缓冲
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
        } catch let audioError as NSError {
            print(audioError)
        }
    }
}






