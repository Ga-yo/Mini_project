//
//  Concentration.swift
//  Card_game
//
//  Created by 이가영 on 2020/02/20.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

struct Concentration{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            return cards.indices.filter {
                cards[$0].isFaceup}.oneAndOnly
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
//            }
            
//            var foundIndex: Int?
//            for index in cards.indices{
//                if cards[index].isFaceup{
//                    if foundIndex == nil{
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceup = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex]
        == cards[index]{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceup = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards)")
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
