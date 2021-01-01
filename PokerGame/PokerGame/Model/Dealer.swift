//
//  Dealer.swift
//  PokerGame
//
//  Created by 신한섭 on 2021/01/01.
//

import Foundation

struct Dealer: Dealable {
    var cardDeck: CardDeck
    var cards: [Card]
    
    init() {
        cardDeck = CardDeck()
        cards = [Card]()
    }
}

protocol Dealable: Playable {
    var cardDeck: CardDeck { get set }
    var count: Int { get }
    var isEmpty: Bool { get }
    mutating func distributeOne() -> Card
}

extension Dealable {
    var count: Int {
        return cardDeck.count
    }
    var isEmpty: Bool {
        return cardDeck.count == 0
    }
    
    mutating func distributeOne() -> Card {
        return cardDeck.removeOne()
    }
}
