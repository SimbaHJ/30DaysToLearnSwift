//
//  ViewController.swift
//  第六天表的刷新
//
//  Created by 霍驹 on 17/2/16.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    var tableView : UITableView?
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var data = [String]()
    
    let refresh = UIRefreshControl.init()
    
    var ischange = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = favoriteEmoji
        creatTable()
    }

    func creatTable(){
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 100*pix, width: WIDTH, height: HEIGHT-100*pix))
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorStyle = .none
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView!)
        
        
        let attributes = [NSForegroundColorAttributeName : UIColor.white , NSFontAttributeName : UIFont.systemFont(ofSize: 20*pix)]
        
        let attributeStr = NSAttributedString.init(string: "last update at \(Date())", attributes: attributes)
        
        refresh.attributedTitle = attributeStr
        refresh.tintColor = UIColor.red
        refresh.backgroundColor = UIColor.orange
        refresh.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView?.addSubview(refresh)
        
        
    }
    func refreshData(){
        if ischange  {
            data = favoriteEmoji
            ischange = false
        }else{
            data = newFavoriteEmoji
            ischange = true
        }
        
        tableView?.reloadData()
        refresh.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    

}









