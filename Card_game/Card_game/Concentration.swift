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
    
    func chooseCard(at index: Int){
        
    }
    
    init(numberOfPairOfCards: Int){
        for _ in 1 ... numberOfPairOfCards{
            let card = Card()
            cards += [card, card]
        }
        
    }
}
