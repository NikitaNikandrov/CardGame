//
//  NetworkService.swift
//  CardGame
//
//  Created by Nikita Nikandrov on 02.01.2025.
//

import Alamofire
import RxSwift

class NetworkService: NetworkServiceProtocol {
    
    func request<T: Decodable>(
                                url: URL,
                                method: HttpMethod,
                                parameters: [String: Any]?,
                                headers: [String: String]?
                                ) -> Observable<T> {
        return Observable.create { observer in
            let afHeaders = HTTPHeaders(headers ?? [:])
            
            AF.request(
                url,
                method: method.alamofireMethod,
                parameters: parameters,
                encoding: method == .get ? URLEncoding.default : JSONEncoding.default,
                headers: afHeaders
            )
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let decodedData):
                    observer.onNext(decodedData)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}
