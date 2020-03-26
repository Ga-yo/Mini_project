//
//  DetailViewController.swift
//  11_Animations
//
//  Created by 이가영 on 2020/03/24.
//  Copyright © 2020 이가영. All rights reserved.
//
import UIKit

//증요한 거는 barTitle에 따라서 switch-case문 이용해 효과를 넣었고
//효과는 모두 함수로 구현되었다.

class DetailViewController: UIViewController {
    
    var barTitle = ""
    var animateView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = barTitle
        setupRect()
        //페북 이미지
    }

    
    func setupRect() {
        if barTitle == "BezierCurve Position"{
            animateView = drawCircleView()
        }else if barTitle == "View Fade In" {
            animateView = UIImageView(image: UIImage(named: "whatsapp"))
            animateView.frame = generalFrame
            animateView.center = generalCenter
        }else{
            animateView = drawRectView(UIColor.red, frame: generalFrame, center: generalCenter)
           
        }
        view.addSubview(animateView)
    }
    
    @IBAction func Buttonact(_ sender: AnyObject){
        switch barTitle {
          case "2-Color":
            changeColor(UIColor.green)
          case "Simple 2D Rotation":
            rotateView(Double.pi)
          case "Multicolor":
            mutiColor(UIColor.green, UIColor.yellow)
          case "Multi Point Position":
            mutiPosition(CGPoint(x: animateView.frame.origin.x, y: 100), CGPoint(x: animateView.frame.origin.x, y: 350))
          case "BezierCurve Position":
              var controlPoint1 = self.animateView.center
              controlPoint1.y -= 125.0
              var controlPoint2 = controlPoint1
              controlPoint2.x += 40.0
              controlPoint2.y -= 125.0;
              var endPoint = self.animateView.center;
              endPoint.x += 75.0
              curvePosition(endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
          
        case "Color and Frame Change":
            let currentFrame = self.animateView.frame
            let firstFrame = currentFrame.insetBy(dx: -30, dy: -50)
            let secondFrame = firstFrame.insetBy(dx: 10, dy: 15)
            let thirdFrame = secondFrame.insetBy(dx: -15, dy: -20)
            colorFrameChange(firstFrame, secondFrame, thirdFrame, UIColor.orange, UIColor.yellow, UIColor.green)
        case "View Fade In":
            viewFadein()
          case "Pop":
            Pop()
            
          default:
            let alert = UIAlertController(title: "No!", message: "default", preferredStyle: UIAlertController.Style.alert)
            self.present(alert, animated: true, completion: nil)
          }
    }
    
    
    fileprivate func changeColor(_ color: UIColor){
        UIView.animate(withDuration: 2.0, animations: {
        self.animateView.backgroundColor = color
        }, completion: nil)
    }
    
    fileprivate func rotateView(_ angel: Double){
        UIView.animate(withDuration: 2.0, delay: 0.2, options: [.repeat], animations: {
        self.animateView.transform = CGAffineTransform(rotationAngle: CGFloat(angel))
        }, completion: nil)
    }
    
    fileprivate func mutiColor(_ first: UIColor, _ second: UIColor){
        UIView.animate(withDuration: 2.0, animations:{ self.animateView.backgroundColor = first}, completion: {finish in self.changeColor(second)})
    }
    
    fileprivate func mutiPosition(_ first: CGPoint, _ second: CGPoint){
        func simplePosition(_ pos: CGPoint){
        UIView.animate(withDuration: 2.0, animations: {
            self.animateView.frame.origin = pos
        }, completion: nil)
        }
    }
    
    fileprivate func viewFadein(){
        let secondImage = UIImageView(image: UIImage(named: "facebook"))
        secondImage.frame = self.animateView.frame
        secondImage.alpha = 0.0
        
        view.insertSubview(secondImage, aboveSubview: self.animateView)
        
        UIView.animate(withDuration: 2.0, delay: 0.2, options: .curveEaseOut, animations: {
        secondImage.alpha = 1.0
        self.animateView.alpha = 0.0
        }, completion: nil)
    }
    
    fileprivate func Pop(){
        UIView.animate(withDuration:0.5,
            animations: {
                self.animateView.transform = CGAffineTransform(scaleX: CGFloat(1.2), y: CGFloat(1.2))
            }, completion: { finished in
                UIView.animate(withDuration: 0.5, animations: {
                self.animateView.transform = CGAffineTransform.identity
              })
          })
        }
    fileprivate func colorFrameChange(_ firstF: CGRect, _ secondF: CGRect, _ thirdF: CGRect, _ firstC: UIColor, _ secondC: UIColor, _ thirdC: UIColor){
        UIView.animate(withDuration: 2.0, animations: {
        self.animateView.backgroundColor = firstC
        self.animateView.frame = firstF
        }, completion: {finished in UIView.animate(withDuration: 2.0, animations: {
        self.animateView.backgroundColor = thirdC
        self.animateView.frame = thirdF
        }, completion: nil) })
    }
    
    fileprivate func curvePosition(_ endPoint: CGPoint, controlPoint1: CGPoint, controlPoint2: CGPoint){
        let path = UIBezierPath()
        path.move(to: self.animateView.center)
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        anim.path = path.cgPath
        anim.duration = 2.0
        
        self.animateView.layer.add(anim, forKey: "animate position")
        self.animateView.center = endPoint
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

