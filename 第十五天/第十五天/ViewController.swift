//
//  ViewController.swift
//  第十五天
//
//  Created by 霍驹 on 17/3/1.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{

    var collection : UICollectionView?
    
    let layout = UICollectionViewFlowLayout()
    
    var imageData = AnimationImageData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatCollection()
    }

    func creatCollection(){
        layout.itemSize = CGSize.init(width: WIDTH-80*pix, height: 400*pix)
        layout.minimumLineSpacing = 40*pix
        layout.headerReferenceSize = CGSize.init(width: WIDTH, height: 40*pix)
        collection = UICollectionView.init(frame: self.view.frame, collectionViewLayout: layout)
        collection?.delegate = self
        collection?.dataSource = self
        collection?.showsVerticalScrollIndicator = false
        collection?.showsHorizontalScrollIndicator = false
        collection?.backgroundColor = UIColor.yellow
        collection?.register(CustomCollectionCell.self, forCellWithReuseIdentifier: "CustomCollectionCell")
        self.view.addSubview(collection!)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionCell", for: indexPath) as? CustomCollectionCell
        item?.backBtnBlock = {
            collectionView.isScrollEnabled = true
            collectionView.reloadItems(at: [indexPath])
        }
        item?.setcellContentView(model: imageData.images [indexPath.row])
        return item!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionCell else {
            return
        }
        cell.cellSelect()
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: {
            cell.frame = collectionView.bounds
        }, completion: { (fa) in
            collectionView.isScrollEnabled = false
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.images.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

