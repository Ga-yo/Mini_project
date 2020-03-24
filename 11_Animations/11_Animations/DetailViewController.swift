//
//  DetailViewController.swift
//  11_Animations
//
//  Created by 이가영 on 2020/03/24.
//  Copyright © 2020 이가영. All rights reserved.
//
import UIKit

class DetailViewController: UIViewController {
    
    var barTitle = ""
    var animateView: UIView!
    
    @IBAction func Buttonact(_ sender: UIButton){
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
            print("DD")
          case "Color and Frame Change":
            print("DD")
          case "View Fade In":
            viewFadein()
          case "Pop":
            Pop()
            
          default:
            let alert = UIAlertController(title: "No!", message: "default", preferredStyle: UIAlertController.Style.alert)
            self.present(alert, animated: true, completion: nil)
          }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRect()
        title = barTitle
        //페북 이미지
    }

    
    fileprivate func setupRect(){
        if(barTitle == "BezierCurve Position"){
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
    
    
    func changeColor(_ color: UIColor){
        UIView.animate(withDuration: 2.0, animations: {
        self.animateView.backgroundColor = color
        }, completion: nil)
    }
    
    func rotateView(_ angel: Double){
        UIView.animate(withDuration: 2.0, delay: 0.2, options: [.repeat], animations: {
        self.animateView.transform = CGAffineTransform(rotationAngle: CGFloat(angel))
        }, completion: nil)
    }
    
    func mutiColor(_ first: UIColor, _ second: UIColor){
        UIView.animate(withDuration: 2.0, animations:{ self.animateView.backgroundColor = first}, completion: {finish in self.changeColor(second)})
    }
    
    func mutiPosition(_ first: CGPoint, _ second: CGPoint){
        func simplePosition(_ pos: CGPoint){
        UIView.animate(withDuration: 2.0, animations: {
            self.animateView.frame.origin = pos
        }, completion: nil)
        }
    }
    
    func viewFadein(){
        let secondImage = UIImageView(image: UIImage(named: "facebook"))
        secondImage.frame = self.animateView.frame
        secondImage.alpha = 0.0
        
        view.insertSubview(secondImage, aboveSubview: self.animateView)
        
        UIView.animate(withDuration: 2.0, delay: 0.2, options: .curveEaseOut, animations: {
        secondImage.alpha = 1.0
        self.animateView.alpha = 0.0
        }, completion: nil)
    }
    
    func Pop(){
        UIView.animate(withDuration:0.5,
            animations: {
                self.animateView.transform = CGAffineTransform(scaleX: CGFloat(1.2), y: CGFloat(1.2))
            }, completion: { finished in
                UIView.animate(withDuration: 0.5, animations: {
                self.animateView.transform = CGAffineTransform.identity
              })
          })
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

