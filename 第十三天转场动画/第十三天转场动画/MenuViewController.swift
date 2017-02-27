//
//  MenuViewController.swift
//  第十三天转场动画
//
//  Created by 霍驹 on 17/2/27.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController , UIViewControllerTransitioningDelegate{

    let menuTransitonManager = MenuTransitionManager()
    
    
    var textButton = UIButton()
    var textLabel = UILabel()
    
    var PhotoButton = UIButton()
    var photoLabel = UILabel()
    
    var quoteButton = UIButton()
    var quoteLabel = UILabel()
    
    var linkButton = UIButton()
    var linkLabel = UILabel()
    
    var chatButton = UIButton()
    var chatLabel = UILabel()
    
    var audioButton = UIButton()
    var audioLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.transitioningDelegate = menuTransitonManager
        
        setUpUI()
    }

    func setUpUI(){
        let blurEffect = UIBlurEffect.init(style: .dark)
        let effectView = UIVisualEffectView.init(effect: blurEffect)
        effectView.frame = view.bounds
        view.addSubview(effectView)
        
        
        textButton = UIButton.init(frame: CGRect.init(x: 175*pix, y: 200*pix, width: 150*pix, height: 150*pix))
        textButton.setBackgroundImage(UIImage.init(named: "Text"), for: .normal)
        effectView.contentView.addSubview(textButton)
        
        
        textLabel = UILabel.init(frame: CGRect.init(x: 175*pix, y: 350*pix, width: 150*pix, height: 50*pix))
        textLabel.text = "Text"
        textLabel.textAlignment = .center
        textLabel.font = UIFont.boldSystemFont(ofSize: 30*pix)
        textLabel.textColor = UIColor.white
        textLabel.backgroundColor = UIColor.clear
        effectView.contentView.addSubview(textLabel)
        
        
        
        PhotoButton = UIButton.init(frame: CGRect.init(x: 425*pix, y: 200*pix, width: 150*pix, height: 150*pix))
        PhotoButton.setBackgroundImage(UIImage.init(named: "Photo"), for: .normal)
        effectView.contentView.addSubview(PhotoButton)
        
        photoLabel = UILabel.init(frame: CGRect.init(x: 425*pix, y: 350*pix, width: 150*pix, height: 50*pix))
        photoLabel.text = "Photo"
        photoLabel.textAlignment = .center
        photoLabel.font = UIFont.boldSystemFont(ofSize: 30*pix)
        photoLabel.textColor = UIColor.white
        photoLabel.backgroundColor = UIColor.clear
        effectView.contentView.addSubview(photoLabel)
        
        
        
        quoteButton = UIButton.init(frame: CGRect.init(x: 175*pix, y: 450*pix, width: 150*pix, height: 150*pix))
        quoteButton.setBackgroundImage(UIImage.init(named: "Quote"), for: .normal)
        effectView.contentView.addSubview(quoteButton)
        
        quoteLabel = UILabel.init(frame: CGRect.init(x: 175*pix, y: 600*pix, width: 150*pix, height: 50*pix))
        quoteLabel.text = "Quote"
        quoteLabel.textAlignment = .center
        quoteLabel.font = UIFont.boldSystemFont(ofSize: 30*pix)
        quoteLabel.textColor = UIColor.white
        quoteLabel.backgroundColor = UIColor.clear
        effectView.contentView.addSubview(quoteLabel)
        
        
        linkButton = UIButton.init(frame: CGRect.init(x: 425*pix, y: 450*pix, width: 150*pix, height: 150*pix))
        linkButton.setBackgroundImage(UIImage.init(named: "Link"), for: .normal)
        effectView.contentView.addSubview(linkButton)
        
        linkLabel = UILabel.init(frame: CGRect.init(x: 425*pix, y: 600*pix, width: 150*pix, height: 50*pix))
        linkLabel.text = "Link"
        linkLabel.textAlignment = .center
        linkLabel.font = UIFont.boldSystemFont(ofSize: 30*pix)
        linkLabel.textColor = UIColor.white
        linkLabel.backgroundColor = UIColor.clear
        effectView.contentView.addSubview(linkLabel)
        
        
        
        chatButton = UIButton.init(frame: CGRect.init(x: 175*pix, y: 700*pix, width: 150*pix, height: 150*pix))
        chatButton.setBackgroundImage(UIImage.init(named: "Chat"), for: .normal)
        effectView.contentView.addSubview(chatButton)
        
        chatLabel = UILabel.init(frame: CGRect.init(x: 175*pix, y: 850*pix, width: 150*pix, height: 50*pix))
        chatLabel.text = "Chat"
        chatLabel.textAlignment = .center
        chatLabel.font = UIFont.boldSystemFont(ofSize: 30*pix)
        chatLabel.textColor = UIColor.white
        chatLabel.backgroundColor = UIColor.clear
        effectView.contentView.addSubview(chatLabel)
        
        
        audioButton = UIButton.init(frame: CGRect.init(x: 425*pix, y: 700*pix, width: 150*pix, height: 150*pix))
        audioButton.setBackgroundImage(UIImage.init(named: "Audio"), for: .normal)
        effectView.contentView.addSubview(audioButton)
        
        audioLabel = UILabel.init(frame: CGRect.init(x: 425*pix, y: 850*pix, width: 150*pix, height: 50*pix))
        audioLabel.text = "Audio"
        audioLabel.textAlignment = .center
        audioLabel.font = UIFont.boldSystemFont(ofSize: 30*pix)
        audioLabel.textColor = UIColor.white
        audioLabel.backgroundColor = UIColor.clear
        effectView.contentView.addSubview(audioLabel)
        
        
        
        
        let backButton = UIButton.init(frame: CGRect.init(x: 300*pix, y: HEIGHT - 250*pix, width: 150*pix, height: 50*pix))
        backButton.setTitle("Go Back", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.backgroundColor = UIColor.clear
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26*pix)
        backButton.addTarget(self, action: #selector(self.goBackBtnTouch), for: .touchUpInside)
        effectView.contentView.addSubview(backButton)
        
        
    }
    func goBackBtnTouch(){
     self.dismiss(animated: true, completion: nil)
    }
    
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        menuTransitonManager.presenting = true
//        return menuTransitonManager
//    }
//    
//    
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        menuTransitonManager.presenting = false
//        return menuTransitonManager
//    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


