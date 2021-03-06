//
//  DealerTests.swift
//  PokerGameTests
//
//  Created by 신한섭 on 2021/01/01.
//

@testable import PokerGame
import XCTest

final class DealerTests: XCTestCase {
    // 카드덱을 가지고 있다.
    // 카드를 한장씩 뿌릴 수 있다.
    // 카드를 한장씩 받을 수 있다.
    // 카드가 부족한 경우를 알 수 있다.
    private var dealer: Dealer = Dealer()
    private let numOfCards: Int = CardMetaData.numOfCards
    
    func testDistributeOne() {
        (0..<numOfCards).forEach { _ in
            let _ = dealer.distributeOne()
        }
        
        XCTAssertEqual(0, dealer.count)
    }
    
    func testIsEmpty() {
        XCTAssertFalse(dealer.isEmpty)
        (0..<numOfCards).forEach { _ in
            _ = dealer.distributeOne()
        }
        XCTAssertTrue(dealer.isEmpty)
    }
    
    func testCount() {
        XCTAssertEqual(dealer.count, numOfCards)
        _ = dealer.distributeOne()
        XCTAssertEqual(dealer.count, numOfCards - 1)
    }
}
