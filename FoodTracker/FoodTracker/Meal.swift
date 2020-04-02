//
//  Meal.swift
//  FoodTracker
//
//  Created by 이가영 on 2020/03/31.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class Meal{
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        guard !name.isEmpty else {
            return nil
        }
         
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
