//
//  RatingControl.swift
//  FoodTracker
//
//  Created by 이가영 on 2020/03/30.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Initialization
    private var ratingButton = [UIButton]()
    
    var rating = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    private func setupButtons(){
        
        for _ in 0..<5{
        let button = UIButton()
        button.backgroundColor = UIColor.red
            
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            addArrangedSubview(button)

            ratingButton.append(button)
        }
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton){
        print("Button pressed😘")
    }
}
