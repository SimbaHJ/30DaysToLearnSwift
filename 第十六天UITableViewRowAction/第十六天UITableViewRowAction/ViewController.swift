//
//  ViewController.swift
//  第十六天UITableViewRowAction
//
//  Created by 霍驹 on 17/3/3.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

struct pattern {
    let image : String
    let name : String
    
}

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    let editTable = UITableView()
    
    let dataArr = [
        pattern(image: "1", name: "Pattern Building"),
        pattern(image: "2", name: "Joe Beez"),
        pattern(image: "3", name: "Car It's car"),
        pattern(image: "4", name: "Floral Kaleidoscopic"),
        pattern(image: "5", name: "Sprinkle Pattern"),
        pattern(image: "6", name: "Palitos de queso"),
        pattern(image: "7", name: "Ready to Go? Pattern"),
        pattern(image: "8", name: "Sets Seamless"),
        pattern(image: "1", name: "Pattern Building"),
        pattern(image: "2", name: "Joe Beez"),
        pattern(image: "3", name: "Car It's car"),
        pattern(image: "4", name: "Floral Kaleidoscopic"),
        pattern(image: "5", name: "Sprinkle Pattern"),
        pattern(image: "6", name: "Palitos de queso"),
        pattern(image: "7", name: "Ready to Go? Pattern"),
        pattern(image: "8", name: "Sets Seamless"),
        
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }

    
    func setUpUI(){
        editTable.frame = CGRect.init(x: 0, y:20, width: WIDTH, height: HEIGHT-20)
        editTable.dataSource = self
        editTable.delegate = self
        editTable.separatorStyle = .none
        editTable.showsVerticalScrollIndicator = false
        editTable.backgroundColor = UIColor.white
        editTable.register(EditCell.self, forCellReuseIdentifier: "EditCell")
        self.view.addSubview(editTable)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : EditCell = tableView.dequeueReusableCell(withIdentifier: "EditCell", for: indexPath) as! EditCell
        let model = dataArr[indexPath.row]
        cell.leftImage.image = UIImage.init(named: model.image)
        cell.rightLabel.text = model.name
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100*pix
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction.init(style: .normal, title: "🗑\nDelete") { (action, index) in
                print(index.row)
        }
        deleteAction.backgroundColor = UIColor.orange
        
        
        
        let shareAction = UITableViewRowAction.init(style: .normal, title: "🤗\nShare") { (action, index) in
            let firstActivityItem = self.dataArr[indexPath.row]
            
            let activityViewController = UIActivityViewController(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil)
            
            self.present(activityViewController, animated: true, completion: nil)
        }
        shareAction.backgroundColor = UIColor.magenta
        
        
        let downloadAction = UITableViewRowAction.init(style: .normal, title: "↓\nDownload") { (action, index) in
            
        }
        downloadAction.backgroundColor = UIColor.brown
        
        
        
        return [ shareAction , downloadAction , deleteAction ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

