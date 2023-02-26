//
//  Movie.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import Foundation

// MARK: - Welcome
struct MovieList: Codable {
    
    let page: Int?
    let results: [Movie]?
    let totalPages, totalResults: Int?
}

// MARK: - Result
struct Movie: Codable {
    
    let backdropPath: String?
    let firstAirDate: String?
    let genreIDS: [Int]?
    let id: Int?
    let name: String?
    let originCountry: [String]?
    let originalLanguage, originalName, overview: String?
    let popularity: Double?
    let posterPath: String?
    let voteAverage: Double?
    let voteCount: Int?
}
