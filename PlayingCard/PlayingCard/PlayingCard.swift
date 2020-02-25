//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by 이가영 on 2020/02/25.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

struct  PlayingCard {
    var suit: suit
    var rank: rank
    
    enum suit: String{
        case spades = "♠"
        case heart = "♥"
        case diamond = "◆"
        case clubs = "♣"
        
        static var all = [suit.spades,.heart,.diamond,.clubs]
    }
    
    enum rank{
        case ace
        case face(String)
        case numbertic(Int)
        
        
        var order: Int{
            switch self {
            case .ace: return 1
            case .numbertic(let pips): return pips
            case .face(let kind) where kind == "J" return 11
            case .face(let kind) where kind == "Q" return 12
            case .face(let kind) where kind == "K" return 13
            default: return 0
            }
        }
        
        static var all: [rank]{
            var allrank = [rank.ace]
            for pips in 2...10{
                allrank.append(rank.numbertic(pips))
                
            }
            allrank=[rank.face("J") , .face("Q"), .face("K")]
            return allrank
        }
    }
}
