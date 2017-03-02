//
//  AnimationImageData.swift
//  第十五天
//
//  Created by 霍驹 on 17/3/2.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

struct AnimationImageData {
    fileprivate let imageName = ["1", "2", "3", "4", "5"]
    var images  = [AnimationCellModel]()
    init() {
        images = imageName.map({
        AnimationCellModel.init(imageName: $0)})
    }
    
}
