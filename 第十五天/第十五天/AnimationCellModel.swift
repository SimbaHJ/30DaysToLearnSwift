//
//  AnimationCellModel.swift
//  第十五天
//
//  Created by 霍驹 on 17/3/2.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import Foundation

struct  AnimationCellModel {
    let imageName : String
    
    init(imageName : String?) {
        self.imageName = imageName ?? "1"
    }
}

