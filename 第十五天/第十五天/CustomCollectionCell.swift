//
//  CustomCollectionCell.swift
//  第十五天
//
//  Created by 霍驹 on 17/3/1.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    var texView = UITextView()
    var imageView = UIImageView()
    var backBtn = UIButton()
    
    var backBtnBlock : (() -> ())?
    
    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setUpUi()
    }
    
    override func layoutSubviews() {
        imageView.frame = CGRect.init(x: 0, y: 0*pix, width: self.bounds.width, height: 300*pix)
        texView.frame = CGRect.init(x: 0*pix, y: 300*pix, width: self.bounds.width, height: 100*pix)
    }
    
    func setcellContentView(model : AnimationCellModel){
        imageView.image = UIImage.init(named: model.imageName)
        backBtn.isHidden = true
    }
    
    func setUpUi(){
        imageView.frame = CGRect.init(x: 0, y: 0*pix, width: self.bounds.width, height: 300*pix)
        imageView.image = UIImage.init(named: "1")
        self.addSubview(imageView)
        
        texView.frame = CGRect.init(x: 0*pix, y: 300*pix, width: self.bounds.width, height: 100*pix)
        texView.textAlignment = .left
        texView.font = UIFont.systemFont(ofSize: 30*pix)
        texView.backgroundColor = UIColor.white
        texView.text = "https://github.com/SimbaHJ/30DaysToLearnSwift"
        texView.showsVerticalScrollIndicator = false
        texView.isScrollEnabled = false
        self.addSubview(texView)
        
        backBtn.frame = CGRect.init(x: 40*pix, y: 40*pix, width: 20*pix, height: 30*pix)
        backBtn.setBackgroundImage(#imageLiteral(resourceName: "Back-icon"), for: .normal)
        backBtn.addTarget(self, action: #selector(backBtnTouch), for: .touchUpInside)
        self.addSubview(backBtn)
    }
    
    func cellSelect(){
        self.superview?.bringSubview(toFront: self)
        backBtn.isHidden = false
    }
    
    func backBtnTouch(){
       self.backBtnBlock?()
        backBtn.isHidden = true
    }
    
}





