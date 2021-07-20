//
//  GameEngine.swift
//  CardGame
//
//  Created by Никита on 20.07.2021.
//

import Foundation

class GameEngine {
    
    //lavel 0: 3x3 grid, lavel 1: 6x6 grid
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
    
    func cardIsChossed(newCardIndex: Int) {
        CardGameData.shared.shownCardsIndexes.append(newCardIndex)
        let cardsCount = CardGameData.shared.shownCardsIndexes.count
        if cardsCount == 1 {
            CardGameData.shared.gameCardsCollection?[newCardIndex].isOpen = true
        } else {
            let firstCard = CardGameData.shared.gameCardsCollection?[newCardIndex - 1]
            let secondCard = CardGameData.shared.gameCardsCollection?[newCardIndex]
            if firstCard == secondCard {
                CardGameData.shared.gameCardsCollection?[newCardIndex].isOpen = true
            } else {
                for i in CardGameData.shared.shownCardsIndexes {
                    CardGameData.shared.gameCardsCollection?[CardGame.CardGameData.shared.shownCardsIndexes[i]].isOpen = false
                }
                CardGameData.shared.shownCardsIndexes = []
            }
        }
        if cardsCount == 3 {
            CardGameData.shared.shownCardsIndexes = []
        }
    }
}
