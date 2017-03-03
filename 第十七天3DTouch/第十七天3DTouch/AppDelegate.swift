//
//  AppDelegate.swift
//  第十七天3DTouch
//
//  Created by 霍驹 on 17/3/3.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        let vc = ViewController()
        let nav = UINavigationController.init(rootViewController: vc)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        setup3DTouch(application)
        return true
    }
    
    func setup3DTouch(_ application : UIApplication){
        let runIcon = UIApplicationShortcutIcon.init(templateImageName: "run")
        let runItem = UIApplicationShortcutItem.init(type: "ONE", localizedTitle: "Begin Run", localizedSubtitle: "", icon: runIcon, userInfo: nil)
        
        let scanIcon = UIApplicationShortcutIcon.init(templateImageName: "scan")
        let scanItem = UIApplicationShortcutItem.init(type: "TWO", localizedTitle: "Scan QR Code", localizedSubtitle: "", icon: scanIcon, userInfo: nil)
        
        let wifiIcon = UIApplicationShortcutIcon.init(templateImageName: "wifi")
        let wifiItem = UIApplicationShortcutItem.init(type: "THREE", localizedTitle: "Switch Wi-Fi", localizedSubtitle: "", icon: wifiIcon, userInfo: nil)
        
        application.shortcutItems = [runItem , scanItem , wifiItem]
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let nav = self.window?.rootViewController as! UINavigationController
        switch shortcutItem.type {
        case "ONE":
            let runVc = RunViewController()
            nav.pushViewController(runVc, animated: true)
        case "TWO":
            let scan = ScanViewController()
            nav.pushViewController(scan, animated: true)
        case "THREE":
            let wifiVc = WifiViewController()
            nav.pushViewController(wifiVc, animated: true)
        default:
            let vc = ViewController()
            nav.pushViewController(vc, animated: true)
        }
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

