//
//  GameTests.swift
//  PokerGameTests
//
//  Created by 신한섭 on 2021/01/01.
//

@testable import PokerGame
import XCTest

final class GameTests: XCTestCase {
    //    게임은 7카드스터드 방식과 5카드스터드를 지원한다.
    //    참여자는 딜러를 제외하고 1명에서 4명까지 참여할 수 있다.
    //    카드게임 종류와 참여자수에 따라 각기 다른 동작을 해야한다.
    //    카드가 남은 경우는 계속해서 게임을 진행하고, 카드가 부족할 경우 종료한다고 가정한다.
    private var game: Game!
    
    func testCardStud() {
        game = Game(stud: .seven, numOfPlayers: .one)
        XCTAssertEqual(game.stud.numOfIndividualCards, 7)
        game = Game(stud: .five, numOfPlayers: .one)
        XCTAssertEqual(game.stud.numOfIndividualCards, 5)
    }
    
    func testNumOfPlayers() {
        game = Game(stud: .seven, numOfPlayers: .one)
        XCTAssertEqual(game.numOfPlayers.count, 1)
        game = Game(stud: .seven, numOfPlayers: .two)
        XCTAssertEqual(game.numOfPlayers.count, 2)
        game = Game(stud: .seven, numOfPlayers: .three)
        XCTAssertEqual(game.numOfPlayers.count, 3)
        game = Game(stud: .seven, numOfPlayers: .four)
        XCTAssertEqual(game.numOfPlayers.count, 4)
    }
    
    func testStartGame() {
        game = Game(stud: .seven, numOfPlayers: .four)
        XCTAssertEqual(game.remainCardsCount, CardMetaData.numOfCards)
        game.start()
        XCTAssertEqual(game.remainCardsCount, CardMetaData.numOfCards - game.stud.numOfIndividualCards * (game.numOfPlayers.count + 1))
    }
    
    func testDistributeCards() {
        game = Game(stud: .seven, numOfPlayers: .four)
        game.start()
        
        XCTAssertFalse(game.distributeCards())
        
        game = Game(stud: .five, numOfPlayers: .four)
        game.start()
        XCTAssertTrue(game.distributeCards())
        
        XCTAssertFalse(game.distributeCards())
    }
    
    func testPlayableIterator() {
        game = Game(stud: .seven, numOfPlayers: .four)
        game.start()
        
        var count = 0
        game.playersIterator {
            count += $0.cards.count
        }
        
        XCTAssertEqual(count, game.stud.numOfIndividualCards * (game.numOfPlayers.count + 1))
    }
    
    func testIndexableInit() {
        XCTAssertEqual(Game.Stud.init(index: 0), Game.Stud.allCases[0])
        XCTAssertEqual(Game.Stud.init(index: 1), Game.Stud.allCases[1])
    }
}
