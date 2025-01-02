//
//  ImageDownloadService.swift
//  CardGame
//
//  Created by Nikita Nikandrov on 02.01.2025.
//

import Foundation
import Alamofire
import RxSwift

protocol ImageDownloadServiceProtocol {
    func fetchRandomImages(count: Int) -> Observable<[Image]>
}

class ImageDownloadService: ImageDownloadServiceProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchRandomImages(count: Int) -> Observable<[Image]> {
        let url = "https://api.pexels.com/v1/curated"
        let headers: HTTPHeaders = [
            "Authorization": PexelsAPIKey.key
        ]
        let parameters: Parameters = [
            "per_page": count
        ]
        
        return Observable.create { observer in
            AF.request(url, method: .get, parameters: parameters, headers: headers)
                .responseDecodable(of: ImageResponse.self) { response in
                    switch response.result {
                    case .success(let imageResponse):
                        // Преобразуем модели API в нужные объекты для отображения
                        let images = imageResponse.photos.map { Image(url: $0.src.original) }
                        observer.onNext(images)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            return Disposables.create()
        }
    }
}
