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
        XCTAssertEqual(CardMetaData.Suit.club.description, "♣")
        XCTAssertEqual(CardMetaData.Suit.diamond.description, "◆")
        XCTAssertEqual(CardMetaData.Suit.heart.description, "♥")
        XCTAssertEqual(CardMetaData.Suit.spade.description, "♠")
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
}
