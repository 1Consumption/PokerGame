//
//  Player.swift
//  PokerGame
//
//  Created by 신한섭 on 2021/01/01.
//

import Foundation

struct Player: Playable {
    var hands: Handable
    
    init() {
        hands = Hands()
    }
}

protocol Playable {
    var hands: Handable { get set }
    mutating func receive(_ card: Card)
    func handIterator(_ task: (Handable) -> Void)
}

extension Playable {
    mutating func receive(_ card: Card) {
        hands.receive(card)
    }
    
    func handIterator(_ task: (Handable) -> Void) {
        task(hands)
    }
}
