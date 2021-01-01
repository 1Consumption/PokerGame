//
//  CardDeckTests.swift
//  PokerGameTests
//
//  Created by 신한섭 on 2020/12/31.
//

@testable import PokerGame
import XCTest

final class CardDeckTests: XCTestCase {
    //    count 갖고 있는 카드 개수를 반환한다.
    //    shuffle 기능은 전체 카드를 랜덤하게 섞는다.
    //    removeOne 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
    //    reset 처음처럼 모든 카드를 다시 채워넣는다.
    
    private var cardDeck: CardDeck = CardDeck()
    private let numOfCards: Int = CardMetaData.numOfCards
    
    func testCount() {
        XCTAssertEqual(cardDeck.count, numOfCards)
        _ = cardDeck.removeOne()
        XCTAssertEqual(cardDeck.count, numOfCards - 1)
    }
    
    func testShuffle() {
        let cardDeckBeforeShuffled = cardDeck
        cardDeck.shuffle()
        XCTAssertNotEqual(cardDeckBeforeShuffled, cardDeck)
    }
    
    func testRemoveOne() {
        var removeds = [Card: Int]()
        
        (0..<numOfCards + 1).forEach { _ in
            guard let removed = cardDeck.removeOne() else { return }
            
            if let value = removeds[removed] {
                removeds[removed] = value + 1
            } else {
                removeds[removed] = 1
            }
        }
        
        XCTAssertEqual(removeds.count, numOfCards)
    }
    
    func testReset() {
        cardDeck.reset()
        XCTAssertEqual(cardDeck.count, numOfCards)
    }
}

extension CardDeck: Equatable {
    public static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.cards == rhs.cards
    }
}
