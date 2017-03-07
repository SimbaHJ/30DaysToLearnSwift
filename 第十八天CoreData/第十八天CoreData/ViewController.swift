//
//  ViewController.swift
//  第十八天CoreData
//
//  Created by 霍驹 on 17/3/7.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    var tableView : UITableView?
    var datas = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datas = CoreDataOperation.shareManager.getData() as! [NSManagedObject]
        
        self.automaticallyAdjustsScrollViewInsets = false
        setUpUI()
    }
    
    
    func setUpUI(){
        //创建表
        tableView = UITableView.init(frame: self.view.frame, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
//        tableView?.separatorStyle = .none
        tableView?.showsVerticalScrollIndicator = false
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView!)
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let item = self.datas[indexPath.row]
        cell?.selectionStyle = .none
        cell?.textLabel?.text = item.value(forKey: "text") as! String
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (datas.count)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction.init(style: .normal, title: "delete") { (action, index) in
          
            let item = self.datas[index.row]
            CoreDataOperation.shareManager.deleteData(item.value(forKey: "text") as! String)
            self.datas = CoreDataOperation.shareManager.getData() as! [NSManagedObject]
            tableView.reloadData()
        }
        delete.backgroundColor = UIColor.red
        
        return [delete]
        
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 160*pix
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        let addBtn = UIButton.init(frame: CGRect.init(x: 660*pix, y: 100*pix, width: 50*pix, height: 50*pix))
        addBtn.setTitle("+", for: .normal)
        addBtn.setTitleColor(UIColor.orange, for: .normal)
        addBtn.backgroundColor = UIColor.white
        addBtn.titleLabel?.font = UIFont.systemFont(ofSize: 50*pix, weight: 2*pix)
        addBtn.addTarget(self, action: #selector(addBtnTouch), for: .touchUpInside)
        view.addSubview(addBtn)
        
        let titleLabel = UILabel.init(frame: CGRect.init(x: 100*pix, y: 100*pix, width: 550*pix, height: 50*pix))
        titleLabel.text = "Core Data"
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 32*pix)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        let line = UILabel.init(frame: CGRect.init(x: 0, y: 159*pix, width: WIDTH, height: pix))
        line.backgroundColor = UIColor.init(red: 39/255.0, green: 39/255.0, blue: 39/255.0, alpha: 1)
        view.addSubview(line)
        
        
        return view
    }
    func addBtnTouch(){
        let alertController = UIAlertController.init(title: "写入数据库", message: "", preferredStyle: .alert)
        
        let addalert = UIAlertAction.init(title: "确定", style: .default) { (action) in
            let field = alertController.textFields?[0]
            CoreDataOperation.shareManager.addData((field?.text)!)
            self.datas = CoreDataOperation.shareManager.getData() as! [NSManagedObject]
            self.tableView?.reloadData()
            
        }
        
        let cancelAlert = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        alertController.addTextField { (textFielf) in
            textFielf.placeholder = "请输入要保存的内容.."
        }
        
        alertController.addAction(addalert)
        alertController.addAction(cancelAlert)
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

