//
//  CardDeck.swift
//  PokerGame
//
//  Created by 신한섭 on 2020/12/31.
//

import Foundation

struct CardDeck {
    private var originalCards: [Card]!
    private(set) var cards: [Card]!
    var count: Int {
        return cards.count
    }
    
    init() {
        generateCards()
        reset()
    }
    
    mutating private func generateCards() {
        originalCards = [Card]()

        CardMetaData.Suit.allCases.forEach { suit in
            CardMetaData.Rank.allCases.forEach { rank in
                originalCards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func removeOne() -> Card {
        return cards.remove(at: Int.random(in: (0..<count)))
    }
    
    mutating func reset() {
        cards = originalCards
    }
}
