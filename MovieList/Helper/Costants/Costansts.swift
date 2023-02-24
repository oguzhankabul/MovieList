//
//  URLConstants.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import Foundation

struct Constants {
    static let baseMovieUrl = "https://api.themoviedb.org/3/tv/popular"
    static let apiKey = "84475224e018cd69873ea9a67e5d0062"
    static let basePhotoUrl = "https://image.tmdb.org/t/p/w185/"
    static func getLanguage(language: Language) -> String {
        return language.rawValue
    }
}

public enum Language: String {
    case eng = "en-US"
}

