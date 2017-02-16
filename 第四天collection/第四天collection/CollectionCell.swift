//
//  CollectionCell.swift
//  第四天collection
//
//  Created by 霍驹 on 17/2/14.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    
    var featuredImageView = UIImageView()
    var interestTitleLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
    fileprivate func updateUI() {
        featuredImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 600*pix, height: 700*pix))
        self.contentView.addSubview(featuredImageView)
        
        interestTitleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 600*pix, width: 600*pix, height: 100*pix))
        interestTitleLabel.backgroundColor = UIColor.white
        interestTitleLabel.alpha = 0.5
        interestTitleLabel.textAlignment = NSTextAlignment.left
        interestTitleLabel.textColor = UIColor.black
        interestTitleLabel.font = UIFont.systemFont(ofSize: 20*pix)
        self.contentView.addSubview(interestTitleLabel)
    }
    
    var model : Model?{
        didSet{
           interestTitleLabel.text = model?.title
            featuredImageView.image = model?.featuredImage
        }
    }
    
}




