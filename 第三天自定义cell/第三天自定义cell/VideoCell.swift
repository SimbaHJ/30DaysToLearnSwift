//
//  VideoCell.swift
//  第三天自定义cell
//
//  Created by 霍驹 on 17/2/14.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit


struct video {
    let image: String
    let title: String
    let source: String
}

class VideoCell: UITableViewCell {
    
    var videoScreenshot = UIImageView()
    var videoStarBtn = UIButton()
    var videoTitleLabel = UILabel()
    var videoSourceLabel = UILabel()
    
//    var signStr :String  {
//        willSet{
//        videoStarBtn.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
//        }
//        didSet{
//        
//        }
//        
//    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
//        self.signStr = ""
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        self.signStr = ""
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    func setUpUI() {
        videoScreenshot = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: WIDTH, height: 400*pix))
        self.contentView.addSubview(videoScreenshot)
        
        videoStarBtn = UIButton.init(frame: CGRect.init(x: 100*pix, y: 10*pix, width: 130*pix, height: 130*pix))
        videoStarBtn.center = CGPoint.init(x: 375*pix, y: 150*pix)
        videoStarBtn.setBackgroundImage(#imageLiteral(resourceName: "playBtn"), for: UIControlState.normal)
        self.contentView.addSubview(videoStarBtn)
        
        videoTitleLabel = UILabel.init(frame: CGRect.init(x: 100*pix, y: 300*pix, width: 550*pix, height: 40*pix))
        videoTitleLabel.font = UIFont(name: "GeezaPro-Bold", size: 30*pix)
        videoTitleLabel.textAlignment = NSTextAlignment.center
        videoTitleLabel.textColor = UIColor.white
        self.contentView.addSubview(videoTitleLabel)
        
        videoSourceLabel = UILabel.init(frame: CGRect.init(x: 100*pix, y: 340*pix, width: 550*pix, height: 30*pix))
        videoSourceLabel.font = UIFont.systemFont(ofSize: 20*pix)
        videoSourceLabel.textAlignment = NSTextAlignment.center
        videoSourceLabel.textColor = UIColor.gray
        self.contentView.addSubview(videoSourceLabel)
        
    }
    
}




