//
//  ViewController.swift
//  第五天 定位
//
//  Created by 霍驹 on 17/2/15.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate {

    var signLabel : UILabel?
    var locationManager : CLLocationManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatBgView()
        creatFindBtn()
        creatCllocationManager()
    }

    func creatBgView(){
        let bgimageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT))
        bgimageView.image = #imageLiteral(resourceName: "bg")
        self.view.addSubview(bgimageView)
        
        let blurEffect = UIBlurEffect.init(style: .light)
        let blurView = UIVisualEffectView.init(effect: blurEffect)
        blurView.frame = CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT)
        self.view.addSubview(blurView)
        
    }
    
    func creatFindBtn(){
        
        signLabel = UILabel.init(frame: CGRect.init(x: 50*pix, y: 100*pix, width: 650*pix, height: 300*pix))
        signLabel?.textColor = UIColor.white
        signLabel?.textAlignment = .center
        signLabel?.font = UIFont.init(name: "GeezaPro-Bold", size: 30*pix)
        signLabel?.numberOfLines = 0
        signLabel?.text = "My location"
        self.view.addSubview(signLabel!)
        
        let findBtn = UIButton.init(frame: CGRect.init(x: 100*pix, y: HEIGHT-200*pix, width: 550*pix, height: 150*pix))
        findBtn.setBackgroundImage(#imageLiteral(resourceName: "Find my location"), for: .normal)
        findBtn.layer.cornerRadius = 75*pix
        findBtn.clipsToBounds = true
        findBtn.addTarget(self, action: #selector(findLocation), for: .touchUpInside)
        findBtn.setTitle("Find My Location", for: .normal)
        self.view.addSubview(findBtn)
    
    }
    
    func creatCllocationManager(){
        locationManager = CLLocationManager.init()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.distanceFilter = 100
        
    }
    func findLocation(){
        locationManager?.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.startUpdatingLocation()
            signLabel?.text = "star"
            print("定位开始")
        }
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
//            
//            if (error != nil) {
//                self.signLabel?.text = "Reverse geocoder failed with error" + error!.localizedDescription
//                return
//            }
//            
//            if placemarks!.count > 0 {
//                let pm = placemarks![0]
//                
//            } else {
//                self.signLabel?.text = "Problem with the data received from geocoder"
//            }
//        })
        
        
        
        let currentLocation : CLLocation = locations.last!
        signLabel?.text = "经度:\(currentLocation.coordinate.longitude) 纬度:\(currentLocation.coordinate.latitude) 海拔:\(currentLocation.altitude) 水平经度: \(currentLocation.horizontalAccuracy) 垂直经度: \(currentLocation.verticalAccuracy)  方向: \(currentLocation.course) 速度:\(currentLocation.speed)"
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        signLabel?.text = "Error while updating location " + error.localizedDescription
        print(error.localizedDescription)
    }
    
    
    

}

