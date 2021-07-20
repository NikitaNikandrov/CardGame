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
    
    //Live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Collection view resources
        gameCollectionView.dataSource = self
        gameCollectionView.delegate = self
        gameCollectionView.register(UINib(nibName: "GameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GameCollectionViewCell")
        
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
    
    
}
