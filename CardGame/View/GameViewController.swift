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
        
    }
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
