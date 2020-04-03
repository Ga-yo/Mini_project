//
//  Meal.swift
//  FoodTracker
//
//  Created by 이가영 on 2020/03/31.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class Meal{
    var name: String //이름
    var photo: UIImage? //사진
    var rating: Int //별점
    
    init?(name: String, photo: UIImage?, rating: Int) {
        guard !name.isEmpty else {
            return nil
        }
         
        // 별점이 5개이기 때문에 0점 이상이거나 5점 이하
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
