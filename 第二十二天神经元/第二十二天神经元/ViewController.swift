//
//  ViewController.swift
//  第二十二天神经元
//
//  Created by 霍驹 on 17/3/22.
//  Copyright © 2017年 霍驹. All rights reserved.
//

struct circleModel {
    var orignX : CGFloat
    var orignY : CGFloat
    var width  : CGFloat
    var offsetX: CGFloat
    var offsetY: CGFloat
    
    init(orignX : CGFloat , orignY : CGFloat , width : CGFloat , offsetX : CGFloat , offsetY : CGFloat) {
        self.orignX = orignX
        self.orignY = orignY
        self.width = width
        self.offsetX = offsetX
        self.offsetY = offsetY
    }
}

struct lineModel {
    var beginX : CGFloat
    var beginY : CGFloat
    var alpha  : CGFloat
    var closeX : CGFloat
    var closeY : CGFloat
    init(beginX : CGFloat , beginY : CGFloat , alpha : CGFloat , closeX : CGFloat , closeY : CGFloat) {
        self.beginX = beginX
        self.beginY = beginY
        self.alpha = alpha
        self.closeX = closeX
        self.closeY = closeY
    }
    
}


import UIKit

class ViewController: UIViewController {
    
    lazy var bgView : UIView! = {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT))
        view.backgroundColor = UIColor.white
        return view
    }()
    
    var pointNum : NSInteger = 15
    
    var circleArr = NSMutableArray()
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setBgView()
        self.view.addSubview(bgView)
        initPrama()
        draw()
        timer = Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(run), userInfo: nil, repeats: true)
        
    }
    
    func run(){
        //        bgView.layer.removeFromSuperlayer()
        bgView.removeFromSuperview()
        bgView = nil
        self.view.addSubview(bgView)
        //        setBgView()
        for i in 0...pointNum-1 {
            var model = circleArr[i] as! circleModel
            model.orignX += model.offsetX
            model.orignY += model.offsetY
            if model.orignX > WIDTH {
                model.orignX = 0
            }else if model.orignX < 0{
                model.orignX = WIDTH
            }
            
            if model.orignY > HEIGHT {
                model.orignY = 0
            }else if model.orignY < 0{
                model.orignY = HEIGHT
            }
            circleArr.replaceObject(at: i, with: model)
        }
        draw()
    }
    
    //绘制圆  和 线
    func draw(){
        for model in circleArr {
            drawCircle(model: model as! circleModel)
        }
        for i in 0...pointNum-1 {
            for j in i...pointNum-1 {
                if i != j {
                    print(i  , j)
                    let model1 = circleArr[i] as! circleModel
                    let model2  = circleArr[j] as! circleModel
                    
                    let difX : CGFloat = abs(model1.orignX - model2.orignX)
                    let difY : CGFloat = abs(model1.orignY - model2.orignY)
                    let length = CGFloat(sqrtf(Float(difX*difX + difY*difY)))
                    var alpha = 0.0
                    print( "length \(length)"   )
                    if length <= WIDTH/5 {
                        alpha = 0.2
                    }
                    else if (WIDTH/5 < length && length < WIDTH / 3 )  {
                        alpha = 0.15
                    }
                    else if (WIDTH / 4 < length && length < WIDTH / 2)  {
                        alpha = 0.1
                    }else{
                        alpha = 0.0
                    }
                    
                    if alpha > 0.05 {
                        let linemodel = lineModel.init(beginX: model1.orignX, beginY: model1.orignY, alpha: CGFloat(alpha), closeX: model2.orignX, closeY: model2.orignY)
                        drawLine(model: linemodel)
                    }
                    
                }
            }
        }
    }
    
    //绘制线
    func drawLine(model : lineModel){
        let shape = CAShapeLayer.init()
        shape.lineWidth = 0.5
        shape.strokeColor = UIColor.init(colorLiteralRed: 100/255.0, green: 100/255.0, blue: 100/255.0, alpha: Float(model.alpha)).cgColor
        
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: model.beginX, y: model.beginY))
        path.addLine(to: CGPoint.init(x: model.closeX, y: model.closeY))
        path.close()
        
        shape.path = path.cgPath
        bgView?.layer.addSublayer(shape)
        
    }
    
    //绘制圆
    func drawCircle(model : circleModel){
        let shape = CAShapeLayer.init()
        let path = UIBezierPath.init(ovalIn: CGRect.init(x: model.orignX, y: model.orignY, width: model.width , height: model.width))
        shape.lineWidth = 4.0
        shape.fillColor = UIColor .clear.cgColor
        shape.strokeColor = UIColor.init(colorLiteralRed: 100/255.0, green: 100/255.0, blue: 100/255.0, alpha: 0.4).cgColor
        shape.path = path.cgPath
        self.bgView?.layer.addSublayer(shape)
        
        
        
    }
    //绘制线
    
    //创建并存储神经元
    func initPrama(){
        for _ in 0...pointNum-1 {
            let circlemodel = circleModel.init(orignX: randmBetween(small: 0, lager: WIDTH), orignY: randmBetween(small: 0, lager: HEIGHT), width: randmBetween(small: 1, lager: 8), offsetX: randmBetween(small: -10, lager: 10)/20, offsetY: randmBetween(small: -10, lager: 10)/20)
            circleArr.add(circlemodel)
        }
    }
    
    //随机返回区间内的值
    func randmBetween(small : CGFloat , lager : CGFloat) -> CGFloat{
        //设计精度
        let precison : CGFloat = 100
        
        let difference = CGFloat(abs(lager - small) * precison + 1)
        
        var randomNum  = arc4random()%(UInt32(difference))
        
        randomNum /= UInt32(precison)
        
        return CGFloat(min(small, lager) + CGFloat(randomNum))
    }
    
    func setBgView(){
        
        bgView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT))
        bgView?.backgroundColor = UIColor.white
        self.view.addSubview(bgView!)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

