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

extension Card: CustomStringConvertible {
    var description: String {
        return "\(suit)\(rank)"
    }
}

extension Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        guard lhs.rank != rhs.rank else { return lhs.suit < rhs.suit }
        return lhs.rank < rhs.rank
    }
}
