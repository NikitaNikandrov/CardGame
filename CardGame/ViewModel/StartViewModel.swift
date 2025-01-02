//
//  StartViewModel.swift
//  CardGame
//
//  Created by Nikita Nikandrov on 01.01.2025.
//

import RxRelay
import RxSwift

class StartViewModel {
    let startButtonTapped = PublishRelay<Void>()
    
    private let disposeBag = DisposeBag()
    
    init() {
        startButtonTapped
            .subscribe(onNext: {
                print("Start button tapped!")
            })
            .disposed(by: disposeBag)
    }
}
