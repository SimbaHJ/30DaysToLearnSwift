//
//  TableViewCell.swift
//  第十天渐变及动画table
//
//  Created by 霍驹 on 17/2/22.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    let gradientLayer = CAGradientLayer()
    
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        gradientLayer.frame = self.bounds
        let color1 = UIColor(white: 1.0, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor(white: 1.0, alpha: 0.1).cgColor as CGColor
        let color3 = UIColor.clear.cgColor as CGColor
        let color4 = UIColor(white: 0.0, alpha: 0.05).cgColor as CGColor
        
        gradientLayer.colors = [color1, color2 ,color3 ,color4]
        gradientLayer.locations = [0.0, 0.4, 0.85, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)
        
        
        
    }
}






