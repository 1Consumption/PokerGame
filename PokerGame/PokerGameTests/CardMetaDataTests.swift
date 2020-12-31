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
        XCTAssertEqual(Suit.club.description, "♣")
        XCTAssertEqual(Suit.diamond.description, "◆")
        XCTAssertEqual(Suit.heart.description, "♥")
        XCTAssertEqual(Suit.spade.description, "♠")
    }
    
    func testRankDescription() {
        XCTAssertEqual(Rank.ace.description, "A")
        XCTAssertEqual(Rank.two.description, "2")
        XCTAssertEqual(Rank.three.description, "3")
        XCTAssertEqual(Rank.four.description, "4")
        XCTAssertEqual(Rank.five.description, "5")
        XCTAssertEqual(Rank.six.description, "6")
        XCTAssertEqual(Rank.seven.description, "7")
        XCTAssertEqual(Rank.eight.description, "8")
        XCTAssertEqual(Rank.nine.description, "9")
        XCTAssertEqual(Rank.ten.description, "10")
        XCTAssertEqual(Rank.jack.description, "J")
        XCTAssertEqual(Rank.queen.description, "Q")
        XCTAssertEqual(Rank.king.description, "K")
    }
}
