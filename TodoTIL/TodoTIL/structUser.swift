//
//  structUser.swift
//  TodoTIL
//
//  Created by 이가영 on 2020/03/12.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

struct User {
    var name: String
    var adress: String
    var description: String
    var time: String
    
    init(name: String, adress: String, description: String, time: String) {
        self.name = name
        self.adress = adress
        self.description = description
        self.time = time
    }
}
