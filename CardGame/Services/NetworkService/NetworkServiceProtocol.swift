//
//  NetworkServiceProtocol.swift
//  CardGame
//
//  Created by Nikita Nikandrov on 02.01.2025.
//

import Foundation
import RxSwift
import Alamofire

protocol NetworkServiceProtocol {
    func request<T: Decodable>(
        url: URL,
        method: HttpMethod,
        parameters: [String: Any]?,
        headers: [String: String]?
    ) -> Observable<T>
}

enum HttpMethod {
    case get
    case post
    case put
    case delete
    
    var alamofireMethod: Alamofire.HTTPMethod {
        switch self {
        case .get: return .get
        case .post: return .post
        case .put: return .put
        case .delete: return .delete
        }
    }
}
