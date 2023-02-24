//
//  MovieCollectionViewCellModel.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import Foundation

final class MovieCollectionViewCellModel {
    public var imageUrl: String?
    public var name: String
    public var raiting: String
    
    public init(imageUrl: String?,
                name: String?,
                raiting: Double?) {
        self.imageUrl = imageUrl
        self.name = name ?? ""
        self.raiting = raiting?.toString() ?? ""
    }
}
