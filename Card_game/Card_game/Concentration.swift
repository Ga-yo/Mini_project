//
//  Concentration.swift
//  Card_game
//
//  Created by 이가영 on 2020/02/20.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

class Concentration{
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
            if cards[index].isFaceup {
                cards[index].isFaceup = false
            } else {
                cards[index].isFaceup = true
            }
    }

    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
}
