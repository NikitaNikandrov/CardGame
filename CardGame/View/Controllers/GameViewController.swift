//
//  GameViewController.swift
//  CardGame
//
//  Created by Nikita Nikandrov on 02.01.2025.
//

import UIKit

class GameViewController: UIViewController {
    private let images: [Image]
    
    init(images: [Image]) {
        self.images = images
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
       
    }
}
