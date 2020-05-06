//
//  stopWatchMD.swift
//  Watch
//
//  Created by 이가영 on 2020/05/06.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

struct stopWatch {
    var count: Double
    var time: Timer
    
    init() {
        self.count = 0.0
        self.time = Timer()
    }
}
