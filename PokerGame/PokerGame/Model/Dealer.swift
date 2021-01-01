//
//  Dealer.swift
//  PokerGame
//
//  Created by 신한섭 on 2021/01/01.
//

import Foundation

final class Dealer: Player {
    private var cardDeck: CardDeck
    var isEmpty: Bool {
        return cardDeck.count == 0
    }
    
    override init() {
        cardDeck = CardDeck()
        super.init()
    }
    
    func distributeOne() -> Card? {
        return cardDeck.removeOne()
    }
}
