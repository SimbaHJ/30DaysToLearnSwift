//
//  GradientTableViewController.swift
//  第十天渐变及动画table
//
//  Created by 霍驹 on 17/2/22.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class GradientTableViewController: UITableViewController {

    var data = ["How many days have passed like this","the citys times fading moving on","Sometimes I‘ve wondered where you’ve gone","story carries on","lonely lost inside","I had this dream so many times","the moments we‘ve spent has passed and gone away","could that be an end to this what I’m feeling deep inside","you know theres no looking back","Glassy sky above","as long as I‘m alive you will be part of me","Glassy sky the cold","the broken pieces of me","Glassy sky it burns","as long as i survive you will be part of me","Glassy sky the cold","the broken pieces of me","Glassy sky above covers over me","over me","How many days have passed like this","the citys times fading moving on","Sometimes I‘ve wondered where you’ve gone","story carries on","lonely lost inside","I had this dream so many times","the moments we‘ve spent has passed and gone away","could that be an end to this what I’m feeling deep inside","you know theres no looking back","Glassy sky above","as long as I‘m alive you will be part of me","Glassy sky the cold","the broken pieces of me","Glassy sky it burns","as long as i survive you will be part of me","Glassy sky the cold","the broken pieces of me","Glassy sky above covers over me","over me"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isStatusBarHidden = true
        self.view.backgroundColor = UIColor.black
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100*pix
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont.init(name: "Avenir Next", size: 32*pix)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    func cellColorForIndex(_ index: Int) -> UIColor{
        let cont = data.count
        let color = UIColor.init(red:1 , green: (CGFloat(index)/CGFloat(cont))*0.8, blue: 0, alpha: 1.0)
        return color
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = cellColorForIndex(indexPath.row)
        cell.transform = CGAffineTransform(translationX: 0, y: self.tableView.bounds.height)
        UIView.animate(withDuration: 1.0, delay: 0.05 * Double(indexPath.row), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            cell.transform = CGAffineTransform(translationX: 0, y: 0);
        }, completion: nil)

    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
