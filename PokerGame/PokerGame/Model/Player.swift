//
//  Player.swift
//  PokerGame
//
//  Created by 신한섭 on 2021/01/01.
//

import Foundation

struct Player: Playable {
    var cards: [Card]
    
    init() {
        cards = [Card]()
    }
}

protocol Playable {
    var cards: [Card] { get set }
    mutating func receive(_ card: Card)
}

extension Playable {
    mutating func receive(_ card: Card) {
        cards.append(card)
    }
}
