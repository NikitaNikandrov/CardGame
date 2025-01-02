//
//  StartViewModel.swift
//  CardGame
//
//  Created by Nikita Nikandrov on 01.01.2025.
//

import RxSwift
import RxCocoa

class StartViewModel {
    // Input
    let startButtonTapped = PublishRelay<Void>()
    
    // Output
    let imagesLoaded = PublishSubject<[Image]>()
    let isLoading = PublishSubject<Bool>()
    let errorOccurred = PublishSubject<String>()
    
    private let imageService: ImageDownloadServiceProtocol
    private let disposeBag = DisposeBag()
    
    init(imageService: ImageDownloadServiceProtocol) {
        self.imageService = imageService
        
        startButtonTapped
            .do(onNext: { [weak self] in self?.isLoading.onNext(true) })
            .flatMapLatest { [weak self] _ -> Observable<[Image]> in
                guard let self = self else { return .empty() }
                return self.imageService.fetchRandomImages(count: 3)
                    .catch { [weak self] error in
                        self?.errorOccurred.onNext(error.localizedDescription)
                        return .empty()
                    }
            }
            .do(onNext: { [weak self] _ in self?.isLoading.onNext(false) })
            .bind(to: imagesLoaded)
            .disposed(by: disposeBag)
    }
}
