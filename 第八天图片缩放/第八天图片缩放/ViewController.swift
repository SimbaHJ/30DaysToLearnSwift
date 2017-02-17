//
//  ViewController.swift
//  第八天图片缩放
//
//  Created by 霍驹 on 17/2/17.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {

    var scrollView : UIScrollView?
    var imageView : UIImageView?
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
            return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImageView()
        setUpControl()
        recenterImage()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        recenterImage()
        if (scrollView?.zoomScale)! < (scrollView?.minimumZoomScale)! {
            scrollView?.zoomScale = (scrollView?.minimumZoomScale)!
        }
    }
    func recenterImage(){
        let scrollViewSize = scrollView?.bounds.size
        let imageViewSize = imageView?.frame.size
        let hSpace = imageViewSize!.width < scrollViewSize!.width ? ((scrollViewSize?.width)! - (imageViewSize?.width)!)/2.0 : 0
        let vSpace = imageViewSize!.height < scrollViewSize!.height ?
        ((scrollViewSize?.height)! - (imageViewSize?.height)!)/2.0 : 0
        scrollView?.contentInset = UIEdgeInsets.init(top: vSpace, left: hSpace, bottom: vSpace, right: hSpace)
//        scrollView?.contentInset = UIEdgeInsetsMake(vSpace, hSpace, 0, 0)
        
    }
    
    func setUpControl(){
        imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 600*pix, height: 600*pix))
//        imageView = UIImageView.init()
        imageView?.image = #imageLiteral(resourceName: "steve")
//        imageView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        scrollView = UIScrollView.init(frame: self.view.bounds)
        
        scrollView?.contentSize = (imageView?.bounds.size)!
        scrollView?.backgroundColor = UIColor.clear
        scrollView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView?.addSubview(imageView!)
        scrollView?.bounces = false
        view.addSubview(scrollView!)
        scrollView?.delegate = self
        setZoomScale()
    }
    
    func setZoomScale(){
        let imageSize = imageView?.bounds.size
        let scrollSize = scrollView?.bounds.size
        
        let widthScale = (scrollSize?.width)!/(imageSize?.width)!
        let heightScale = (scrollSize?.height)!/(imageSize?.height)!
        
        scrollView?.minimumZoomScale = min(widthScale, heightScale)
        scrollView?.maximumZoomScale = 3.0
        scrollView?.zoomScale = (scrollView?.minimumZoomScale)!
        
    }
    
    func bgImageView(){
        let bgimageView = UIImageView.init(frame: self.view.bounds)
        bgimageView.image = #imageLiteral(resourceName: "steve")
        self.view.addSubview(bgimageView)
        
        let blurEffect = UIBlurEffect.init(style: .light)
        let blurView = UIVisualEffectView.init(effect: blurEffect)
        blurView.frame = CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT)
        self.view.addSubview(blurView)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        recenterImage()
    }

}




