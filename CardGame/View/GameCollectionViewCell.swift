//
//  GameCollectionViewCell.swift
//  CardGame
//
//  Created by Никита on 20.07.2021.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    //Outlets
    @IBOutlet weak var cardImage: UIImageView!
    
    //Variables
    var imageIsHidden: Bool?
    
    //Live cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .systemGray2
        hideImage()
        
    }
    
    func hideImage(){
        if imageIsHidden ?? true {
            self.cardImage.isHidden = true
        } else {
            self.cardImage.isHidden = false
        }
    }

}

extension UIImageView {
    func loadImage(posterURL: String) {
            let networkService = NetworkService()
            networkService.loadImageFromURL(imageURL: posterURL) { (result) in
                guard let result = result else { return }
                DispatchQueue.main.async {
                    self.image = result
                }
            }
        }
}
