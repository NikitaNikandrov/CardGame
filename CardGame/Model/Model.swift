//
//  Model.swift
//  CardGame
//
//  Created by Никита on 20.07.2021.
//

import Foundation
import UIKit

class GameCard: Equatable {
    static func == (lhs: GameCard, rhs: GameCard) -> Bool {
        return lhs.cardID == rhs.cardID
    }
    
    var cardID: Int?
    var isOpen: Bool = false
    var cardImageURL: String?
}
