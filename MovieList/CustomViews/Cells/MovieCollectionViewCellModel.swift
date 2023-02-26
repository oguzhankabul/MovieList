//
//  MovieCollectionViewCellModel.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import UIKit

final class MovieCollectionViewCellModel {
    public var image: UIImage
    public var name: String
    public var raiting: String
    
    public init(image: UIImage,
                name: String,
                raiting: String) {
        self.image = image
        self.name = name
        self.raiting = raiting
    }
}
