//
//  LeftViewtableCell.swift
//  第二十天自定义侧滑二
//
//  Created by 霍驹 on 17/3/11.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class LeftViewtableCell: UITableViewCell {

    var contentText = UILabel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    override func layoutSubviews() {
        
    }
    
    func setUpUI (){
        let imageView = UIImageView.init(frame: CGRect.init(x: 70*pix, y: 25*pix, width: 50*pix, height: 50*pix))
        imageView.image = #imageLiteral(resourceName: "qq")
        self.addSubview(imageView)
        
        
        contentText.frame = CGRect.init(x: 130*pix, y: 30*pix, width: 500*pix, height: 40*pix)
        contentText.textAlignment = .left
        contentText.textColor = UIColor.white
        contentText.font = UIFont.init(name: "PingFangSC-Light", size: 35*pix)
        self.addSubview(contentText)
    
        let line = UILabel.init(frame: CGRect.init(x: 120*pix, y: 99*pix, width: 400*pix, height: pix))
        line.backgroundColor = UIColor.white
        self.addSubview(line)
        
    }

}
