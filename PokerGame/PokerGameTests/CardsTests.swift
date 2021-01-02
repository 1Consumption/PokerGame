//
//  CardsTests.swift
//  PokerGameTests
//
//  Created by 신한섭 on 2021/01/02.
//

@testable import PokerGame
import XCTest

final class CardsTests: XCTestCase {
    
    func testCompare() {
        // ♠ > ♥ > ♦ > ♣
        let spadeA = Card(suit: .spade, rank: .ace)
        let heartA = Card(suit: .heart, rank: .ace)
        
        XCTAssertGreaterThan(spadeA, heartA)
        
        let spadeJ = Card(suit: .spade, rank: .jack)
        let clubQ = Card(suit: .club, rank: .queen)
        
        XCTAssertGreaterThan(clubQ, spadeJ)
    }
}
