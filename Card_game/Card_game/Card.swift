//
//  Card.swift
//  Card_game
//
//  Created by 이가영 on 2020/02/20.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

struct Card {
    var isFaceup = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
