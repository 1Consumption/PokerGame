//
//  Hands.swift
//  PokerGame
//
//  Created by 신한섭 on 2021/01/03.
//

import Foundation

protocol Handable {
    var cards: [Card] { get }
    mutating func receive(_ card: Card)
    func cardsIterator(_ task: (Card) -> Void)
}

struct Hands: Handable {
    private(set) var cards: [Card]
    
    init() {
        cards = [Card]()
    }
    
    mutating func receive(_ card: Card) {
        cards.append(card)
    }
    
    func cardsIterator(_ task: (Card) -> Void) {
        cards.forEach {
            task($0)
        }
    }
}
