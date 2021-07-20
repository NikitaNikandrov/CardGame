//
//  ViewController.swift
//  CardGame
//
//  Created by Никита on 19.07.2021.
//

import UIKit

class StartingViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var difficultLabel: UILabel!
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    
    //Actions
    @IBAction func easyButtonIsPressed(_ sender: Any) {
        presentGameViewController(difficulty: 0)
    }
    
    @IBAction func mediumButtonIsPressed(_ sender: Any) {
        presentGameViewController(difficulty: 1)
    }
    
    //Live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup texts, colours, etc
        self.navigationController?.navigationBar.topItem?.title = "Card Game"
        self.easyButton.setTitle("Easy", for: .normal)
        self.mediumButton.setTitle("Medium", for: .normal)
        setupButton(button: easyButton)
        setupButton(button: mediumButton)
    }
    //Custom View Controller func
    func setupButton(button: UIButton) {
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGray2
        button.layer.cornerRadius = 5
    }
    
    func presentGameViewController(difficulty: Int){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let gameVC = storyboard.instantiateViewController(identifier: "GameViewController") as? GameViewController else { return }
        CardGameData.shared.difficulty = difficulty
        show(gameVC, sender: nil)
    }
}

