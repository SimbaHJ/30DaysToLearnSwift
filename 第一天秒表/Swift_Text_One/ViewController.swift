//
//  ViewController.swift
//  Swift_Text_One
//
//  Created by 霍驹 on 17/1/3.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var playBtn = UIButton()
    var pauseBtn = UIButton()
    var timeLabel = UILabel()
    var resetBtn = UIButton()
    
    
    var timer = Timer()
    
    var counter = 0.0
    var isPlaying = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatBtn()
        
    }

    func creatBtn() {
        
        let leftView = UIView.init(frame: CGRect.init(x: 0, y: 400*pix, width: 375*pix, height: HEIGHT-400*pix))
        leftView.backgroundColor = UIColor.green
        self.view.addSubview(leftView)
        
        let rightView = UIView.init(frame: CGRect.init(x: 375*pix, y: 400*pix, width: 375*pix, height: HEIGHT-400*pix))
        rightView.backgroundColor = UIColor.blue
        self.view.addSubview(rightView)
        
    
        playBtn = UIButton.init()
        playBtn.frame = CGRect.init(x: leftView.center.x, y: leftView.center.y, width:80*pix  , height: 80*pix)
        playBtn.center = CGPoint.init(x: leftView.center.x, y: leftView.center.y)
        playBtn.setBackgroundImage(UIImage.init(named: "play"), for: UIControlState(rawValue: 0))
        playBtn.addTarget(self, action: #selector(self.playBtnTouch), for: UIControlEvents.touchUpInside)
        self.view.addSubview(playBtn)
        
        
        pauseBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 80*pix, height: 80*pix))
        pauseBtn.center = CGPoint.init(x: rightView.center.x, y: rightView.center.y)
        pauseBtn.setBackgroundImage(UIImage.init(named: "pause"), for: UIControlState.normal)
        pauseBtn.addTarget(self, action: #selector(self.pauseBtnTouch), for: UIControlEvents.touchUpInside)
        self.view.addSubview(pauseBtn)
        
        
        timeLabel = UILabel.init(frame: CGRect.init(x: 100*pix, y: 100*pix, width: 550*pix, height: 200*pix))
        timeLabel.font = UIFont.systemFont(ofSize: 60*pix)
        timeLabel.text = "0.0"
        timeLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(timeLabel)
        
        resetBtn = UIButton.init(frame: CGRect.init(x: 600*pix, y: 100*pix, width: 100*pix, height: 60*pix))
        resetBtn.setTitle("重置", for: UIControlState.normal)
        resetBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        resetBtn.addTarget(self, action: #selector(self.resetBtnTouch), for: UIControlEvents.touchUpInside)
        self.view.addSubview(resetBtn)
        
    }
    func  playBtnTouch()  {
        if isPlaying {
            return
        }
        isPlaying = true
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.timeClick), userInfo: nil, repeats: true)
    }
    
    func  pauseBtnTouch()  {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    func resetBtnTouch() {
        isPlaying = false
        counter = 0.0
        timeLabel.text = "0.0"
        timer.invalidate()
        pauseBtn.isEnabled = true
        playBtn.isEnabled = true
    }
    
    func timeClick()  {
        counter = counter + 0.1
        timeLabel.text = String(counter)
    }

}

