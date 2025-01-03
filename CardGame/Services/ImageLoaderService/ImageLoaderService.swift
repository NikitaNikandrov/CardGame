//
//  ImageLoaderService.swift
//  CardGame
//
//  Created by Nikita Nikandrov on 03.01.2025.
//

import RxSwift
import Alamofire

protocol ImageLoaderServiceProtocol {
    func loadImages(from urls: [URL]) -> Observable<[UIImage]>
}

class ImageLoaderService: ImageLoaderServiceProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func loadImages(from urls: [URL]) -> Observable<[UIImage]> {
        return Observable.create { observer in
            let disposables = CompositeDisposable()
            var images: [UIImage] = []
            
            let imageRequests = urls.map { url in
                self.networkService.request(url: url, method: .get, parameters: nil, headers: nil)
                    .map { (data: Data) -> UIImage? in
                        UIImage(data: data)
                    }
                    .compactMap { $0 } // Убираем nil из результатов
            }
            
            // Объединяем загрузки в массив изображений
            let disposable = Observable.zip(imageRequests)
                .subscribe(onNext: { loadedImages in
                    images.append(contentsOf: loadedImages)
                    observer.onNext(images)
                    observer.onCompleted()
                }, onError: { error in
                    observer.onError(error)
                })
            
            _ = disposables.insert(disposable)
            
            return Disposables.create {
                disposables.dispose()
            }
        }
    }
}
