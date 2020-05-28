//
//  WorldMD.swift
//  Watch
//
//  Created by 이가영 on 2020/05/28.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

struct WorldMD {
    var worldName: String
    var worldClock: String
    var numberOfWorld: Int
    var isSelected: Bool
    
    init() {
        self.worldClock = ""
        self.worldName = ""
        self.numberOfWorld = 0
        self.isSelected = true
    }
}
