//
//  ImageModel.swift
//  CardGame
//
//  Created by Nikita Nikandrov on 02.01.2025.
//

import Foundation

struct ImageResponse: Decodable {
    let photos: [Photo]
}

struct Photo: Decodable {
    let id: Int
    let src: PhotoSource
}

struct PhotoSource: Decodable {
    let original: String
}
