//
//  TimerMD.swift
//  Watch
//
//  Created by 이가영 on 2020/05/22.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

struct TimerMD {
    var timerTime: Timer
    var counter: Date
    
    init() {
        self.timerTime = Timer()
        self.counter = Date()
    }
}
