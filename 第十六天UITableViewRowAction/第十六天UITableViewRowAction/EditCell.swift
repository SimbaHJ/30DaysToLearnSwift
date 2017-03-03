//
//  EditCell.swift
//  第十六天UITableViewRowAction
//
//  Created by 霍驹 on 17/3/3.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class EditCell: UITableViewCell {

    var leftImage = UIImageView()
    var rightLabel = UILabel()
    let cellHeight = 100*pix
    
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
    
    
//    override func layoutSubviews() {
//        
//        leftImage.frame = CGRect.init(x: 0*pix, y: 0, width: 300*pix, height: cellHeight)
//        rightLabel.frame = CGRect.init(x: 320*pix, y: (cellHeight-40*pix)/2, width: 400*pix, height: 40*pix)
//    }
    
    func setUpUI(){
        
        leftImage.frame = CGRect.init(x: 0*pix, y: 0, width: 300*pix, height: cellHeight)
        self.contentView.addSubview(leftImage)
        
        rightLabel.frame = CGRect.init(x: 320*pix, y: (cellHeight-30*pix)/2, width: 400*pix, height: 40*pix)
        rightLabel.textAlignment = .left
        rightLabel.font = UIFont.systemFont(ofSize: 30*pix)
        self.contentView.addSubview(rightLabel)
    
    }
    
}
