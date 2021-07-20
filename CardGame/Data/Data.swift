//
//  Data.swift
//  CardGame
//
//  Created by Никита on 20.07.2021.
//

import Foundation

final class CardGameData {
    static var shared = CardGameData()
    private init(){
        gameCardsCollection = []
        imageURLSCollection = [ "https://i.natgeofe.com/n/6490d605-b11a-4919-963e-f1e6f3c0d4b6/sumatran-tiger-thumbnail-nationalgeographic_1456276.jpg",
            "https://static.wixstatic.com/media/6a6c40_38cdd70bb8c541b68e59f716b57b0418f000.jpg/v1/fill/w_320,h_235,al_c,q_80,usm_0.33_1.00_0.00/6a6c40_38cdd70bb8c541b68e59f716b57b0418f000.webp",
            "https://images.theconversation.com/files/230552/original/file-20180803-41366-8x4waf.JPG?ixlib=rb-1.1.0&q=45&auto=format&w=926&fit=clip",
            "https://s.auto.drom.ru/i24203/r/photos/204041/big_1117342.jpg",
            "https://lh3.googleusercontent.com/proxy/Fxr3cDO5YUH39sC4HXZmiPAsXJI2nyNIU6IWmDqkWHCRiBA3REUIhGhuFdmBa8ph0H0TK8bQPTJp-ghUaXEfIcvv0ZA",
            "https://images.drive.ru/i/0/5fcf2787ec05c462490000d9.jpg",
            "https://upload.wikimedia.org/wikipedia/commons/7/7d/Male-lion-new.jpg",
            "https://images.unsplash.com/photo-1593179449458-e0d43d512551?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDl8fHxlbnwwfHx8fA%3D%3D&w=1000&q=80",
            "http://images2.minutemediacdn.com/image/upload/c_crop,h_1193,w_2121,x_0,y_64/f_auto,q_auto,w_1100/v1565279671/shape/mentalfloss/578211-gettyimages-542930526.jpg",
            "https://avtonovostidnya.ru/wp-content/uploads/2020/06/bmw-4-series-1-e1591120875299.jpg",
            "https://newsroom.porsche.com/.imaging/mte/porsche-templating-theme/image_1290x726/dam/pnr/2020/company/Deliveries-Q1-2020/b2-The-current-Porsche-911-model-series-is-still-popular-with-customers.jpg/jcr:content/b2-The%20current%20Porsche%20911%20model%20series%20is%20still%20popular%20with%20customers.jpg",
            "https://cdnimg.rg.ru/i/gallery/68c33cdb/1_305feb51.jpg",
            "https://vzletim.ru/upload/medialibrary/1f9/mig29.jpg",
            "http://cdn.iz.ru/sites/default/files/styles/900x506/public/news-2018-08/2880px-100217-F-4684-266_%284367744565%29_1.jpg?itok=9jZOzuKI",
            "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/RAF_Eurofighter_EF-2000_Typhoon_F2_Lofting-1.jpg/1200px-RAF_Eurofighter_EF-2000_Typhoon_F2_Lofting-1.jpg" ]
        
        shownCardsIndexes = []
        
    }
    var gameCardsCollection: [GameCard]?
    var imageURLSCollection: [String]?
    var shownCardsIndexes: [Int]
}
