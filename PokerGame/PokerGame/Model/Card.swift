//
//  Card.swift
//  PokerGame
//
//  Created by 신한섭 on 2020/12/31.
//

import Foundation

struct Card: Hashable {
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}
