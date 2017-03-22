//
//  ViewController.swift
//  第二十一天自定义简单瀑布流
//
//  Created by 霍驹 on 17/3/21.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class ViewController: UIViewController  , UICollectionViewDelegate , UICollectionViewDataSource{

    var collection : UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = CustomLayout.init()
        layout.lineItemSpace = 10.0
        layout.itemSpace = 10.0
        
        collection = UICollectionView.init(frame: CGRect.init(x: 0, y: 20, width: WIDTH, height: HEIGHT-20), collectionViewLayout: layout)
        collection?.delegate = self
        collection?.dataSource = self
        collection?.backgroundColor = UIColor.white
        collection?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(collection!)
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        
        cell.backgroundColor = UIColor.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

