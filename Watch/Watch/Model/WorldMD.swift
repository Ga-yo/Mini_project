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
    var isSelected: Bool
    
    init(worldNam: String, worldClock: String) {
        self.worldClock = worldNam
        self.worldName = worldClock
        self.isSelected = true
    }
}
