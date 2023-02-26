//
//  SnakeCaseJsonDecoder.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 26.02.2023.
//

import Foundation

class SnakeCaseJSONDecoder: JSONDecoder {
    override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
    }
}

