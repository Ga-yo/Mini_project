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
    //별 사이즈
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setupButtons()
        }
    }
    //별 개수
    @IBInspectable var starCount: Int = 5{
        didSet{
            setupButtons()
        }
    }
    
    //버튼 선언
    private var ratingButton = [UIButton]()
    
    var rating = 0 {
        didSet{
            updateButtonSelectionStates()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //별점 셋ㅇ
    private func setupButtons(){
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledstar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptystar", in:  bundle,compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        for button in ratingButton{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButton.removeAll()

        for index in 0..<starCount{
            
        let button = UIButton()
        button.backgroundColor = UIColor.red
            button.accessibilityLabel = "Set \(index + 1) star rating"

            //버튼에는 일반, 강조, 포커스, 선택 및 비활성화로 5가지 상태가 있다.
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted,.selected])
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
        guard let index = ratingButton.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButton)")
        }
        
        let selectedRating = index + 1
        if selectedRating == rating{
            rating = 0
        }else{
            rating = selectedRating
        }
    }
    
    private func updateButtonSelectionStates(){
        
        for(index, button) in ratingButton.enumerated(){
             button.isSelected = index < rating
            let hintString: String?
            
            if rating == index + 1{
                hintString = "tap to reset the rating to zero"
            }else{
                hintString = nil
            }
            
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set"
            case 1:
                valueString = "1 star set"
            default:
                valueString = "\(rating) stars set"
            }
            
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
           
        }
    }
}
