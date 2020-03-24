//
//  Common.swift
//  11_Animations
//
//  Created by 이가영 on 2020/03/24.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation
import UIKit

let screenRect = UIScreen.main.bounds
let generalFrame = CGRect(x: 0, y: 0, width: screenRect.width / 2.0, height: screenRect.height / 4.0)
let generalCenter = CGPoint(x: screenRect.midX, y: screenRect.midY - 50)


func drawRectView(_ color: UIColor, frame: CGRect, center: CGPoint) -> UIView{
    let view = UIView(frame: frame)
    view.center = center
    view.backgroundColor = color
    return view
}

func drawCircleView() -> UIView {
    let shapeLayer = CAShapeLayer()
    
shapeLayer.fillColor = UIColor.red.cgColor
    shapeLayer.strokeColor = UIColor.red.cgColor
    shapeLayer.lineWidth = 3.0
    
    let view = UIView()
    view.layer.addSublayer(shapeLayer)
    
    return view
}
