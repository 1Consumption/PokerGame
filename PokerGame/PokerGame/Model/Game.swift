//
//  Game.swift
//  PokerGame
//
//  Created by 신한섭 on 2021/01/01.
//

import Foundation

struct Game {
    enum Stud {
        case seven
        case five
        
        var numOfIndividualCards: Int {
            switch self {
            case .five:
                return 5
            case .seven:
                return 7
            }
        }
    }
    
    enum NumOfPlayers: Int {
        case one = 1,
             two,
             three,
             four
        
        var count: Int {
            return self.rawValue
        }
    }
    
    private var dealer: Dealable
    private var players: [Playable]
    private(set) var stud: Stud
    private(set) var numOfPlayers: NumOfPlayers
    var remainCardsCount: Int {
        return dealer.count
    }
    private var isAvailable: Bool {
        return remainCardsCount >= stud.numOfIndividualCards * numOfPlayers.count
    }
    
    init(stud: Stud, numOfPlayers: NumOfPlayers) {
        self.stud = stud
        self.numOfPlayers = numOfPlayers
        dealer = Dealer()
        players = [Player](repeating: Player(), count: numOfPlayers.count)
    }
    
    mutating func start() {
        distributeCards()
    }
    
    @discardableResult
    mutating func distributeCards() -> Bool {
        guard isAvailable else { return false }
        (0..<players.count).forEach { index in
            (0..<stud.numOfIndividualCards).forEach { _ in
                let card = dealer.distributeOne()
                players[index].receive(card)
            }
        }
        
        (0..<stud.numOfIndividualCards).forEach { _ in
            let card = dealer.distributeOne()
            dealer.receive(card)
        }
        
        return true
    }
}
