//
//  NetworkService.swift
//  CardGame
//
//  Created by Никита on 20.07.2021.
//

import Foundation
import UIKit

class NetworkService {
    func loadImageFromURL(imageURL: String,  closure: @escaping((UIImage?) -> Void)) {
        guard let urlResponce = URL(string: imageURL) else { return }
        let task = URLSession.shared.dataTask(with: urlResponce) { [ weak self ] (data, _, _) in
            guard let data = data,
                  let image = UIImage(data: data) else { return }
            closure(image)
        }
        task.resume()
    }
}
