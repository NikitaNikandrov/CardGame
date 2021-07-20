//
//  GameEngine.swift
//  CardGame
//
//  Created by Никита on 20.07.2021.
//

import Foundation

class GameEngine {
    
    //lavel 0: 3x3 grid, lavel 1: 6x6 grid
    func prepareCards() {
        let lavelOfDifficulty = CardGameData.shared.difficulty
        switch lavelOfDifficulty {
        case 0:
            var newCards: [GameCard] = []
            CardGameData.shared.imageURLSCollection.shuffle()
            for i in 0...2 {
                let card = GameCard()
                card.cardID = i
                card.isClosed = false
                card.cardImageURL = CardGameData.shared.imageURLSCollection[i]
                newCards.append(card)
            }
            for _ in 0...2 {
                for j in 0...2 {
                    CardGameData.shared.gameCardsCollection?.append(newCards[j])
                }
            }
            CardGameData.shared.gameCardsCollection?.shuffle()
        case 1:
            var newCards: [GameCard] = []
            CardGameData.shared.imageURLSCollection.shuffle()
            for i in 0...11 {
                let card = GameCard()
                card.cardID = i
                card.isClosed = false
                card.cardImageURL = CardGameData.shared.imageURLSCollection[i]
                newCards.append(card)
            }
            for _ in 0...2 { // 12 images * 3
                for j in 0...11 {
                    CardGameData.shared.gameCardsCollection?.append(newCards[j])
                }
            }
            CardGameData.shared.gameCardsCollection?.shuffle()
        default:
            return
        }
    }
    
    func cardIsChossed(newCardIndex: Int) {
        CardGameData.shared.shownCardsIndexes.append(newCardIndex)
        let cardsCount = CardGameData.shared.shownCardsIndexes.count
        if cardsCount == 1 {
            CardGameData.shared.gameCardsCollection?[newCardIndex].isClosed = true
        } else {
            let firstCard = CardGameData.shared.gameCardsCollection?[newCardIndex - 2]
            let secondCard = CardGameData.shared.gameCardsCollection?[newCardIndex - 1]
            if firstCard == secondCard {
                CardGameData.shared.gameCardsCollection?[newCardIndex].isClosed = true
            } else {
                for i in CardGameData.shared.shownCardsIndexes {
                    CardGameData.shared.gameCardsCollection?[CardGame.CardGameData.shared.shownCardsIndexes[i]].isClosed = false
                }
                CardGameData.shared.shownCardsIndexes = []
            }
        }
        if cardsCount == 3 {
            CardGameData.shared.shownCardsIndexes = []
        }
    }
}
