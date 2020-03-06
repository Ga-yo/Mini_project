//
//  structTime.swift
//  2_stopWatch
//
//  Created by 이가영 on 2020/03/06.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

class structTime: NSObject {
  var count: Double
  var time: Timer

  override init() {
    count = 0.0
    time = Timer()
  }
}
