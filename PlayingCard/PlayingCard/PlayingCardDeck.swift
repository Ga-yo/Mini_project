//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by 이가영 on 2020/02/25.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

struct PlayingCardDeck{
    private(set) var cards = [PlayingCard]()
    
    func draw() -> PlayingCard {
        if cards.count > 0{
            return cards.remove(at: cards.count.arc4random)
        }
    }
}
