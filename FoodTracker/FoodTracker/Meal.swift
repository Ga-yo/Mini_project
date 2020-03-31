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
        if(name.isEmpty || rating < 0){
            return nil
        }
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
