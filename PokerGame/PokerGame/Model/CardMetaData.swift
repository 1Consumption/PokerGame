//
//  CardMetaData.swift
//  PokerGame
//
//  Created by 신한섭 on 2020/12/31.
//

import Foundation

enum CardMetaData {
    static let numOfCards: Int = 52
    
    enum Suit: CustomStringConvertible, CaseIterable {
        case spade
        case club
        case heart
        case diamond
        
        var description: String {
            switch self {
            case .club:
                return "♣"
            case .diamond:
                return "◆"
            case .heart:
                return "♥"
            case .spade:
                return "♠"
            }
        }
    }

    enum Rank: Int, CustomStringConvertible, CaseIterable {
        case ace = 1,
        two,
        three,
        four,
        five,
        six,
        seven,
        eight,
        nine,
        ten,
        jack,
        queen,
        king
        
        var description: String {
            switch self {
            case .ace:
                return "A"
            case .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten:
                return "\(self.rawValue)"
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            }
        }
    }

}
