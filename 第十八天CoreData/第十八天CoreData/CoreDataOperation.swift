//
//  CoreDataOperation.swift
//  第十八天CoreData
//
//  Created by 霍驹 on 17/3/7.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit
import CoreData

class CoreDataOperation: NSObject {
    
    static let shareManager = CoreDataOperation()
    
    
    private override init(){
    
    }
    
    private func getContext() -> NSManagedObjectContext{
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        return appdelegate.persistentContainer.viewContext
    }
    //添加
    func addData (_ str : String){
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "TableList", in: context)
        let model = NSManagedObject.init(entity: entity!, insertInto: context)
        model.setValue(str, forKey: "text")
        do {
            try context.save()
        } catch  {
            
        }
    }
    //获取全部数据
    func getData() -> NSArray{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "TableList")
        do {
            let arr = try getContext().fetch(fetchRequest) as! [NSManagedObject]
            return arr as NSArray
        } catch  {
          return []
        }
        
    }
    
    //删除
    func deleteData(_ str : String){
        let context = getContext()
        let formatStr = "text='\(str)'"
        let predicate = NSPredicate.init(format: formatStr, argumentArray: nil)
        let requst = NSFetchRequest<NSFetchRequestResult>.init(entityName: "TableList")
        requst.predicate = predicate
        do {
            let arr = try context.fetch(requst) as NSArray
            context.delete(arr[0] as! NSManagedObject)
            try context.save()
        } catch  {
            
        }
        
    }
    
    
    
    
}
