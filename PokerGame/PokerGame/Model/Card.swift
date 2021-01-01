//
//  Card.swift
//  PokerGame
//
//  Created by 신한섭 on 2020/12/31.
//

import Foundation

struct Card: Hashable {
    let suit: CardMetaData.Suit
    let rank: CardMetaData.Rank
    
    init(suit: CardMetaData.Suit, rank: CardMetaData.Rank) {
        self.suit = suit
        self.rank = rank
    }
}
