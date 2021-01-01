//
//  Player.swift
//  PokerGame
//
//  Created by 신한섭 on 2021/01/01.
//

import Foundation

class Player {
    private(set) var cards: [Card]
    
    init() {
        cards = [Card]()
    }
    
    func receive(_ card: Card) {
        cards.append(card)
    }
}
