//
//  ViewController.swift
//  第十四天字数限制
//
//  Created by 霍驹 on 17/2/28.
//  Copyright © 2017年 霍驹. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextViewDelegate{

    let headImageView = UIImageView()
    let textView = UITextView()
    let bottomImageView = UIImageView()
    let textNum = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 54/255.0, green: 69/255.0, blue: 92/255.0, alpha: 1)
        setUpUI()
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyBoardWillShow(_ note : Notification ){
        let info = note.userInfo
        let keyBoardBounds = (info?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (info![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let transY = keyBoardBounds.size.height
        
        let options = UIViewAnimationOptions(rawValue: UInt((info![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
        
        UIView.animate(withDuration: duration, delay: 0.0, options: options, animations: {
            self.bottomImageView.transform = CGAffineTransform.init(translationX: 0, y: -transY)
        }, completion: { (fas) in
            
        })
        
        
        
    
    }
    
    func keyBoardWillHide(_ note : NSNotification){
        let info = note.userInfo
        let duration = (info?[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        
        let options = UIViewAnimationOptions(rawValue: UInt((info![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
        
        UIView.animate(withDuration: duration, delay: 0.0, options: options, animations: {
            self.bottomImageView.transform = CGAffineTransform.identity
        }, completion: { (fas) in
            
        })
    
    }
    
    
    
    func setUpUI(){
       
        headImageView.frame = CGRect.init(x: 40*pix, y: 200*pix, width: 80*pix, height: 80*pix)
        headImageView.image = #imageLiteral(resourceName: "emojiself avatar")
        headImageView.clipsToBounds = true
        headImageView.layer.cornerRadius = 40*pix
        view.addSubview(headImageView)
        
        
        textView.frame = CGRect.init(x: 200*pix, y: 200*pix, width: 400*pix, height: 400*pix)
        textView.delegate = self
        textView.font = UIFont.systemFont(ofSize: 30*pix)
        textView.backgroundColor = UIColor.init(red: 54/255.0, green: 69/255.0, blue: 92/255.0, alpha: 1)
        textView.textColor = UIColor.white
        view.addSubview(textView)
        
        bottomImageView.frame = CGRect.init(x: 0, y: HEIGHT-100*pix, width: WIDTH, height: 100*pix)
        bottomImageView.image = #imageLiteral(resourceName: "toolbar")
        view.addSubview(bottomImageView)
        
        textNum.frame = CGRect.init(x: 325*pix, y: 15*pix, width: 100*pix, height: 70*pix)
        textNum.textAlignment = .center
        textNum.font = UIFont.systemFont(ofSize: 32*pix)
        textNum.textColor = UIColor.white
        textNum.text = "20";
        textNum.backgroundColor = UIColor.clear
        bottomImageView.addSubview(textNum)
    
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.characters.count > 200 {
        let index = textView.text.index(textView.text.startIndex, offsetBy: 200)
        textView.text = textView.text.substring(to: index)
        }
        textNum.text = String(200-textView.text.characters.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}

