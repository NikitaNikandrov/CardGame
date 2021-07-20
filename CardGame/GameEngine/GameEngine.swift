//
//  GameEngine.swift
//  CardGame
//
//  Created by Никита on 20.07.2021.
//

import Foundation

class GameEngine {
    
    func prepareCards(withLavel: Int) {
        switch withLavel {
        case 0:
            var newCards: [GameCard] = []
            CardGameData.shared.imageURLSCollection?.shuffle()
            for i in 0...2 {
                let card = GameCard()
                card.cardID = i
                card.isOpen = false
                card.cardImageURL = CardGameData.shared.imageURLSCollection![i]
                newCards.append(card)
            }
            for _ in 0...2 {
                for j in 0...2 {
                    CardGameData.shared.gameCardsCollection?.append(newCards[j])
                }
            }
            CardGameData.shared.gameCardsCollection?.shuffle()
        default:
            <#code#>
        }
    }
}
