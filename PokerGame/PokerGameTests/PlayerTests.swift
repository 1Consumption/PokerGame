//
//  PlayerTests.swift
//  PokerGameTests
//
//  Created by 신한섭 on 2021/01/01.
//

@testable import PokerGame
import XCTest

final class PlayerTests: XCTestCase {
    // 카드를 한장씩 받을 수 있다.
    private var player: Player = Player()
    private var cardDeck: CardDeck = CardDeck()
    
    func testReceiveCard() {
        let card = cardDeck.removeOne()
        player.receive(card)
        XCTAssertTrue(player.cards.contains(card))
    }
}
