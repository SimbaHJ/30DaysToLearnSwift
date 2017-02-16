//
//  ViewController.swift
//  第四天collection
//
//  Created by 霍驹 on 17/2/14.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    var collection : UICollectionView?
    
    
    fileprivate var data = Model.createInterests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT))
        bgImageView.image = #imageLiteral(resourceName: "blue")
        self.view.addSubview(bgImageView)
        
        //添加毛玻璃效果
        showBlurEffect()
        
        
        
        creatCollectionView()
    }
    
    func showBlurEffect(){
        let blurEffect = UIBlurEffect.init(style: .light)
        
        let blurView = UIVisualEffectView.init(effect: blurEffect)
        blurView.frame = CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT)
        self.view.addSubview(blurView)
        
        let vibrancyEffect = UIVibrancyEffect.init(blurEffect: blurEffect)
        let vibrancyView = UIVisualEffectView.init(effect: vibrancyEffect)
        vibrancyView.frame = CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT)
        
        let signLabel = UILabel.init(frame: CGRect.init(x: 0, y: 100*pix, width: WIDTH, height: 200*pix))
        signLabel.text = "梦里不觉秋已深  余情岂是为他人"
        signLabel.numberOfLines = 0
        signLabel.font = UIFont.init(name: "GeezaPro-Bold", size: 40*pix)
        signLabel.textAlignment = .center
        signLabel.textColor = UIColor.white
        vibrancyView.contentView.addSubview(signLabel)
        
        blurView.contentView.addSubview(vibrancyView)
        self.view.addSubview(blurView)
        
        
        
    }

    func creatCollectionView() {
        let layout = UICollectionViewFlowLayout.init()
        collection = UICollectionView.init(frame: CGRect.init(x: 0, y: 300*pix, width: WIDTH, height: 700*pix), collectionViewLayout: layout)
        layout.itemSize = CGSize.init(width: 600*pix, height: 700*pix)
        layout.minimumInteritemSpacing = 10*pix
        layout.minimumLineSpacing = 40*pix
        collection?.showsVerticalScrollIndicator = false
        collection?.showsHorizontalScrollIndicator = true
        collection?.delegate = self
        collection?.dataSource = self
        collection?.register(CollectionCell.self, forCellWithReuseIdentifier: "cell")
        layout.scrollDirection = .horizontal
        collection?.backgroundColor = UIColor.clear
        
        self.view.addSubview(collection!)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection?.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
        
        cell.model = data[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

}

