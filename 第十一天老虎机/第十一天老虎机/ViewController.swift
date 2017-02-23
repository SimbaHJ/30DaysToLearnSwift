//
//  ViewController.swift
//  第十一天老虎机
//
//  Created by 霍驹 on 17/2/23.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {

    let emojiPickerView = UIPickerView()
    let goBtn = UIButton()
    let resultLabel = UILabel()
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var bounds: CGRect = CGRect.zero
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        goBtn.alpha = 0
        emojiPickerView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        UIView.animate(withDuration: 1, delay: 0.3, options: .curveEaseOut, animations: {
            self.goBtn.alpha = 1
            self.emojiPickerView.alpha = 1
        }
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        
        for i in 0 ..< 100 {
            dataArray1.append((Int)(arc4random()%10))
            dataArray2.append((Int)(arc4random()%10))
            dataArray3.append((Int)(arc4random()%10))
        }
        
        
        
    }

    func setUpUI() {
        let bgimageView = UIImageView.init(frame: self.view.bounds)
        bgimageView.image = #imageLiteral(resourceName: "Hyperspace")
        view.addSubview(bgimageView)
        
        let blurEffect = UIBlurEffect.init(style: .light)
        let blurView = UIVisualEffectView.init(effect: blurEffect)
        blurView.frame = view.bounds
        view.addSubview(blurView)
        
        emojiPickerView.frame = CGRect.init(x: 0, y: 400*pix, width: WIDTH, height: 300*pix)
        emojiPickerView.delegate = self
        emojiPickerView.dataSource = self
        view.addSubview(emojiPickerView)
        
        goBtn.frame = CGRect.init(x: 100*pix, y: 800*pix, width: 550*pix, height: 80*pix)
        goBtn.setTitle("go", for: .normal)
        goBtn.setTitleColor(UIColor.green, for: .normal)
        goBtn.backgroundColor = UIColor.blue
        goBtn.addTarget(self, action: #selector(self.goBtnTouch), for: .touchUpInside)
        goBtn.clipsToBounds = true
        goBtn.layer.cornerRadius = 10*pix
        view.addSubview(goBtn)
        bounds = goBtn.bounds
        
        
        resultLabel.frame = CGRect.init(x: 0, y: HEIGHT - 300*pix, width: WIDTH, height: 80*pix)
        resultLabel.text = ""
        resultLabel.font = UIFont.init(name: "Apple Color Emoji", size: 40*pix)
        resultLabel.textAlignment = NSTextAlignment.center
        resultLabel.textColor = UIColor.white
        view.addSubview(resultLabel)
        
    }
    
    func goBtnTouch(){
        
        emojiPickerView.selectRow((Int)(arc4random()%99), inComponent: 0, animated: true)
        emojiPickerView.selectRow((Int)(arc4random()%99), inComponent: 1, animated: true)
        emojiPickerView.selectRow((Int)(arc4random()%99), inComponent: 2, animated: true)
        
        if(dataArray1[emojiPickerView.selectedRow(inComponent: 0)] == dataArray2[emojiPickerView.selectedRow(inComponent: 1)] && dataArray2[emojiPickerView.selectedRow(inComponent: 1)] == dataArray3[emojiPickerView.selectedRow(inComponent: 2)]) {
            
            resultLabel.text = "Bingo!"
            
        } else {
            
            resultLabel.text = "💔"
            
            
        }
        
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: {
            self.goBtn.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width + 20, height: self.bounds.size.height)
        }, completion: { (Bool) in
            self.goBtn.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height)
        })
        
        
    }
    
    
    //pickView 协议
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 160*pix
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 160*pix
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let label = UILabel()
        if component == 0 {
            label.text = imageArray[dataArray1[row]]
        }else if component == 1{
            label.text = imageArray[dataArray2[row]]
        }
        else{
            label.text = imageArray[dataArray3[row]]
        }
            label.font = UIFont.init(name: "Apple Color Emoji", size: 140*pix)
            label.textAlignment = NSTextAlignment.center
        return label
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

