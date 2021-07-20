//
//  GameViewController.swift
//  CardGame
//
//  Created by Никита on 20.07.2021.
//

import UIKit

class GameViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var gameCollectionView: UICollectionView!
    
    //Constants
    let gameEngine = GameEngine()
    
    //Live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Collection view resources
        gameCollectionView.dataSource = self
        gameCollectionView.delegate = self
        gameCollectionView.register(UINib(nibName: "GameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GameCollectionViewCell")
        
        gameEngine.prepareCards()
        
    }
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = CardGameData.shared.gameCardsCollection?.count else { return 0 }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as! GameCollectionViewCell
        cell.imageIsHidden = CardGameData.shared.gameCardsCollection?[indexPath.row].isClosed
        cell.cardImage.loadImage(posterURL: (CardGameData.shared.gameCardsCollection?[indexPath.row].cardImageURL)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let difficulty = CardGameData.shared.difficulty
        switch difficulty {
        case 0:
            let size = (gameCollectionView.bounds.width - 4)/3
            return CGSize(width: size, height: size)
        case 1:
            let size = (gameCollectionView.bounds.width - 7)/3
            return CGSize(width: size, height: size)
        default:
            let size = (gameCollectionView.bounds.width - 4)/3
            return CGSize(width: size, height: size)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        gameEngine.cardIsChossed(newCardIndex: indexPath.row)
        gameCollectionView.reloadData()
    }
}
