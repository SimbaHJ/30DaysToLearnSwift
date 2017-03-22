//
//  CustomLayout.swift
//  第二十一天自定义简单瀑布流
//
//  Created by 霍驹 on 17/3/21.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class CustomLayout: UICollectionViewLayout {

    //行间距
    var lineItemSpace : CGFloat = 0.0
    //列间距
    var itemSpace : CGFloat = 0.0
    //collection内间距
    var inset : UIEdgeInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    //列数
    var columnNum : Int = 3
    //每一列的最大Y值
    private var colimnMaxYArr = [CGFloat]()
    //所有cell的布局属性
    private var attrsArr = [UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        super.prepare()
        //重置每列的最大值
        colimnMaxYArr.removeAll()
        for _ in 0...columnNum-1 {
            colimnMaxYArr.append(inset.top)
        }
        
        //存储全部item的属性
        self.attrsArr.removeAll()
        let count : Int = (self.collectionView?.numberOfItems(inSection: 0))!
        for row in 0...count-1 {
            let index = NSIndexPath.init(item: row, section: 0)
            let attrs : UICollectionViewLayoutAttributes = layoutAttributesForItem(at: index as IndexPath)!
            self.attrsArr.append(attrs)
        }
        

    }
    
    override var collectionViewContentSize: CGSize {
        var maxY = colimnMaxYArr[0]
        for Y in colimnMaxYArr {
            if maxY < Y {
                maxY = Y
            }
        }
        return CGSize.init(width: 0, height: maxY + inset.top)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attrs = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        //单个cell宽度
        let cellWidth = (WIDTH - inset.left + inset.right - (CGFloat)(colimnMaxYArr.count - 1) * itemSpace)/(CGFloat)(colimnMaxYArr.count)
        
       //cell的高度
        let cellHeight = 50 + arc4random_uniform(150)
        
        //找出最短的一列 和 最大的Y值
        var minY = colimnMaxYArr[0]
        var Y = 0;
        
        for index in 0...(colimnMaxYArr.count - 1) {
            if minY > colimnMaxYArr[index] {
                minY = colimnMaxYArr[index]
                Y = index
            }
        }
        //cell的x坐标
        let cellX : CGFloat = inset.left + CGFloat(Y) * (cellWidth + itemSpace)
        //cell的y坐标
        let cellY : CGFloat = lineItemSpace + minY
        //cell的frame
        attrs.frame = CGRect.init(x: cellX, y: cellY, width: cellWidth, height: CGFloat(cellHeight))
        //跟新添加cell 列的Y值
        colimnMaxYArr[Y] = cellY + CGFloat(cellHeight)
        return attrs
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attrsArr
    }
    
}
