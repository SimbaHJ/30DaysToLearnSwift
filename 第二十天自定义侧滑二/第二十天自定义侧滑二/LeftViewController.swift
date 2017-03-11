//
//  LeftViewController.swift
//  第二十天自定义侧滑二
//
//  Created by 霍驹 on 17/3/11.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    let titlesDictionary = ["开通会员", "QQ钱包", "网上营业厅", "个性装扮", "我的收藏", "我的相册", "我的文件"]
    
    var cellDidSelect : ((String) -> Void)?
    
    var table = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        setUpUI()
    }

    func setUpUI(){
        table.frame = CGRect.init(x: 0, y: 0, width: 0.78*WIDTH, height: HEIGHT)
        table.backgroundColor = UIColor.clear
        table.delegate = self
        table.dataSource = self
        table.tableHeaderView = headViewForTable()
        table.tableFooterView = footViewTable()
        table.separatorStyle = .none
        table.register(LeftViewtableCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(table)
    }
    
    func headViewForTable() -> UIView{
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0.78*WIDTH, height: 450*pix))
        view.backgroundColor = UIColor.clear
        
        let headImage = UIImageView.init(frame: CGRect.init(x: 40*pix, y: 230*pix, width: 140*pix, height: 140*pix))
        headImage.image = #imageLiteral(resourceName: "IMG_1794.JPG")
        headImage.clipsToBounds = true
        headImage.layer.cornerRadius = 70*pix
        view.addSubview(headImage)
        
        let nickNameLabel = UILabel.init(frame: CGRect.init(x: 200*pix, y: 250*pix, width: 340*pix, height: 50*pix))
        nickNameLabel.textColor = UIColor.white
        nickNameLabel.font = UIFont.init(name: "PingFangSC-Light", size: 40*pix)
        nickNameLabel.textAlignment = .left
        nickNameLabel.text = "在来一个币"
        view.addSubview(nickNameLabel)
        
        for a in 1...5{
            let statImageView = UIImageView.init(frame: CGRect.init(x: 200*pix+(CGFloat)(a-1)*60*pix, y: 300*pix, width: 50*pix, height: 50*pix))
            statImageView.image = #imageLiteral(resourceName: "xingxing")
            view.addSubview(statImageView)
        }
        
        
        let mottoLabel = UILabel.init(frame: CGRect.init(x:50*pix, y: 390*pix, width: 550*pix, height: 40*pix))
        mottoLabel.backgroundColor = UIColor.clear
        mottoLabel.textColor = color(R: 219, G: 219, B: 219)
        mottoLabel.font = UIFont.init(name: "PingFangSC-Light", size: 30*pix)
        mottoLabel.textAlignment = .left
        mottoLabel.text = "虽然很优秀,但还是单身..."
        view.addSubview(mottoLabel)
        
        return view
    }
    
    func footViewTable() -> UIView{
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0.78*WIDTH, height: 150*pix))
        view.backgroundColor = UIColor.clear
        
        let strArr = ["设置","夜间"]
        
        for a in 0...1 {
            let imageView = UIImageView.init(frame: CGRect.init(x: 70*pix+(CGFloat)(a)*200*pix, y: 20*pix, width: 50*pix, height: 50*pix))
            imageView.image = #imageLiteral(resourceName: "qq")
            view.addSubview(imageView)
            
            let label = UILabel.init(frame: CGRect.init(x: 130*pix+(CGFloat)(a)*200*pix, y: 20*pix, width: 100*pix, height: 50*pix))
            label.backgroundColor = UIColor.clear
            label.textColor = UIColor.white
            label.font = UIFont.init(name: "PingFangSC-Light", size: 40*pix)
            label.textAlignment = .left
            label.text = strArr[a]
            view.addSubview(label)
            
        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LeftViewtableCell
        
        
        cell.contentText.text = titlesDictionary[indexPath.row]
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = UIColor.clear
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesDictionary.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100*pix
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cellDidSelect!(titlesDictionary[indexPath.row])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
