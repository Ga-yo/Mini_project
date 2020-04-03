//
//  Meal.swift
//  FoodTracker
//
//  Created by 이가영 on 2020/03/31.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import os.log

struct PropertyKey {
    static let name = "name"
    static let photo = "photo"
    static let rating = "rating"

}
class Meal: NSObject, NSCoding{

    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first
    static let ArchiveURL = DocumentsDirectory?.appendingPathComponent("meals")
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
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: PropertyKey.name)
        coder.encode(photo, forKey: PropertyKey.photo)
        coder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder: NSCoder) {
        guard let name = coder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let photo = coder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = coder.decodeInteger(forKey: PropertyKey.rating)
        
        self.init(name: name, photo: photo, rating: rating)
    }
    
}
