//
//  ViewController.swift
//  第十天渐变及动画table
//
//  Created by 霍驹 on 17/2/22.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    let table = GradientTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.tableView.frame = self.view.bounds
//        table.tableView.delegate = self
        self.view.addSubview(table.tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

