//
//  ViewController.swift
//  CardGame
//
//  Created by Nikita Nikandrov on 01.01.2025.
//

import UIKit
import RxSwift
import RxCocoa

class StartViewController: UIViewController {
    
    private let startButton = UIButton(type: .system)
    private let viewModel: StartViewModel
    private let disposeBag = DisposeBag()
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    init(viewModel: StartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let buttonHeight = startButton.bounds.height
        let fontSize = buttonHeight * 0.5
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        startButton.layer.cornerRadius = buttonHeight * 0.3
    }

    private func setupUI() {
        view.backgroundColor = .white
        startButton.setTitle("Start", for: .normal)
        startButton.tintColor = .white
        startButton.backgroundColor = .blue
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height / 3),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            startButton.heightAnchor.constraint(equalTo: startButton.widthAnchor, multiplier: 1/3)
        ])
    }

    private func bindViewModel() {
            startButton.rx.tap
                .bind(to: viewModel.startButtonTapped)
                .disposed(by: disposeBag)
            
            viewModel.isLoading
                .observe(on: MainScheduler.instance)
                .bind(to: activityIndicator.rx.isAnimating)
                .disposed(by: disposeBag)
            
            viewModel.imagesLoaded
                .observe(on: MainScheduler.instance)
                .subscribe(onNext: { [weak self] images in
                    guard let self = self else { return }
                    let gameVC = GameViewController(images: images)
                    self.navigationController?.pushViewController(gameVC, animated: true)
                })
                .disposed(by: disposeBag)
            
            viewModel.errorOccurred
                .observe(on: MainScheduler.instance)
                .subscribe(onNext: { [weak self] errorMessage in
                    self?.showErrorAlert(message: errorMessage)
                })
                .disposed(by: disposeBag)
        }
        
        private func showErrorAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
}
