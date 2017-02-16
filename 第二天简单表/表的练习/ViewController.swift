//
//  ViewController.swift
//  表的练习
//
//  Created by 霍驹 on 17/2/14.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource {

    var textTable = UITableView()
    var data = ["30 Days Swift", "在这个特殊的日子里「奋斗」和「理想」", "建一个工程 敲两行代码", "吃饭旅行 走走停停", "呵呵，再见🤗 See you next Project", "QQ 545119722",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@"]
    var fontNames = ["PingFangSC-Light", "GeezaPro-Bold", "Avenir-Medium", "Palatino-Bold", "LaoSangamMN"]
    var changeBtn = UIButton()

    var fontIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family) {
                print(font)
            }
        }
        
        creatView()
        
    }
    
    func creatView() {
        textTable = UITableView.init(frame: CGRect.init(x: 0, y: 100*pix, width: WIDTH, height: 800*pix))
        textTable.delegate = self
        textTable.dataSource = self
        textTable.register(UITableViewCell.self, forCellReuseIdentifier: "fontcell")
        textTable.separatorStyle = UITableViewCellSeparatorStyle.none
        textTable.backgroundColor = UIColor.black
        self.view.addSubview(textTable)
        
        changeBtn = UIButton.init(frame: CGRect.init(x: (750*pix-(HEIGHT-900*pix)/2)/2, y: 900*pix+(HEIGHT-900*pix)/8, width: (HEIGHT-900*pix)/2, height: (HEIGHT-900*pix)/2 ))
        changeBtn.backgroundColor = UIColor.yellow
        changeBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        changeBtn.setTitle("Change Font", for: UIControlState.normal)
        changeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30*pix)
        changeBtn.layer.cornerRadius = (HEIGHT-900*pix)/4
        changeBtn.clipsToBounds = true
        changeBtn.addTarget(self, action: #selector(ViewController.changeBtnTouch), for: UIControlEvents.touchUpInside)
        self.view.addSubview(changeBtn)
    }

    func changeBtnTouch()  {
        fontIndex = (fontIndex + 1) % 5
        print(fontNames[fontIndex])
        textTable.reloadData()
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontcell")
        cell?.textLabel?.text = data[indexPath.row]
        cell?.textLabel?.textColor = UIColor.white
        cell?.textLabel?.font = UIFont(name: fontNames[fontIndex], size: 30*pix)
        cell?.backgroundColor = UIColor.black
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70*pix
    }
}

