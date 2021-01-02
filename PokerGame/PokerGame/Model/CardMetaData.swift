//
//  CardMetaData.swift
//  PokerGame
//
//  Created by 신한섭 on 2020/12/31.
//

import Foundation

enum CardMetaData {
    static let numOfCards: Int = 52
    
    enum Suit: CustomStringConvertible, CaseIterable, Comparable {
        case club
        case diamond
        case heart
        case spade
        
        var description: String {
            switch self {
            case .club:
                return "c"
            case .diamond:
                return "d"
            case .heart:
                return "h"
            case .spade:
                return "s"
            }
        }
    }
    
    enum Rank: Int, CustomStringConvertible, CaseIterable, Comparable {
        static func < (lhs: CardMetaData.Rank, rhs: CardMetaData.Rank) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
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
        
        init(index: Int) {
            self = Self.allCases[index]
        }
    }
    
}
