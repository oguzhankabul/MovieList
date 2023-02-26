//
//  MoviePresentation.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 26.02.2023.
//

import UIKit

struct MoviePresentation {
    
    let backdropPath: String
    let firstAirDate: String
    let genreIDS: [Int]
    let id: Int
    let name: String
    let originCountry: String
    let originalLanguage: String
    let originalName, overview: String
    let popularity: Double
    let movieImage: UIImage
    let voteAverage: String
    let voteCount: Int
    let detailTagList: [String]
}

extension MoviePresentation {
    
    init (movie: Movie) {
        
        self.init(backdropPath: movie.backdropPath ?? "",
                  firstAirDate: movie.firstAirDate?.components(separatedBy: "-").first ?? "",
                  genreIDS: movie.genreIDS ?? [],
                  id: movie.id ?? 0,
                  name: movie.name ?? "",
                  originCountry: movie.originCountry?.first ?? "",
                  originalLanguage: movie.originalLanguage ?? "",
                  originalName: movie.originalName ?? "",
                  overview: movie.overview ?? "",
                  popularity: movie.popularity ?? 0,
                  movieImage: UIImage(url: URL(string: Constants.basePhotoUrl+(movie.posterPath ?? ""))) ?? .remove,
                  voteAverage: movie.voteAverage?.toString() ?? "",
                  voteCount: movie.voteCount ?? 0,
                  detailTagList: [movie.originalLanguage, movie.originCountry?.first, movie.firstAirDate?.components(separatedBy: "-").first, movie.voteAverage?.toString()].compactMap({ $0 }))
    }
}
