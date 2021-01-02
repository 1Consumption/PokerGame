//
//  CardGeneratorTests.swift
//  PokerGameTests
//
//  Created by 신한섭 on 2020/12/31.
//

@testable import PokerGame
import XCTest

final class CardMetaDataTests: XCTestCase {
    
    func testSuitDescription() {
        XCTAssertEqual(CardMetaData.Suit.club.description, "c")
        XCTAssertEqual(CardMetaData.Suit.diamond.description, "d")
        XCTAssertEqual(CardMetaData.Suit.heart.description, "h")
        XCTAssertEqual(CardMetaData.Suit.spade.description, "s")
    }

    func testRankDescription() {
        XCTAssertEqual(CardMetaData.Rank.ace.description, "A")
        XCTAssertEqual(CardMetaData.Rank.two.description, "2")
        XCTAssertEqual(CardMetaData.Rank.three.description, "3")
        XCTAssertEqual(CardMetaData.Rank.four.description, "4")
        XCTAssertEqual(CardMetaData.Rank.five.description, "5")
        XCTAssertEqual(CardMetaData.Rank.six.description, "6")
        XCTAssertEqual(CardMetaData.Rank.seven.description, "7")
        XCTAssertEqual(CardMetaData.Rank.eight.description, "8")
        XCTAssertEqual(CardMetaData.Rank.nine.description, "9")
        XCTAssertEqual(CardMetaData.Rank.ten.description, "10")
        XCTAssertEqual(CardMetaData.Rank.jack.description, "J")
        XCTAssertEqual(CardMetaData.Rank.queen.description, "Q")
        XCTAssertEqual(CardMetaData.Rank.king.description, "K")
    }
    
    func testCardDescription() {
        XCTAssertEqual("\(Card(suit: .club, rank: .ace))", "cA")
    }
    
    func testSuitCompare() {
        // ♠ > ♥ > ♦ > ♣
        let spade = CardMetaData.Suit.spade
        let heart = CardMetaData.Suit.heart
        let diamond = CardMetaData.Suit.diamond
        let club = CardMetaData.Suit.club
        
        XCTAssertGreaterThan(spade, heart)
        XCTAssertGreaterThan(spade, diamond)
        XCTAssertGreaterThan(spade, club)
        
        XCTAssertGreaterThan(heart, diamond)
        XCTAssertGreaterThan(heart, club)
        
        XCTAssertGreaterThan(diamond, club)
    }
    
    func testRankCompare() {
        (0..<CardMetaData.Rank.allCases.count).forEach { index in
            (index + 1..<CardMetaData.Rank.allCases.count).forEach {
                XCTAssertLessThan(CardMetaData.Rank(index: index), CardMetaData.Rank(index: $0))
            }
        }
    }
}
