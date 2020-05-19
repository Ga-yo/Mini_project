//
//  AlramMD.swift
//  Watch
//
//  Created by 이가영 on 2020/05/07.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

struct AlramMD {
    var clock: String
    //var repeatAlram: [String]
    var nameAlram: String
    var isInsert: Bool!
    
    init(clock: String, name: String, isInsert: Bool) {
        self.clock = clock
        self.nameAlram = name
        self.isInsert = false
    }
}
