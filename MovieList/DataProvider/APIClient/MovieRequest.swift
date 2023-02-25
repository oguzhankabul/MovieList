//
//  Request.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import Foundation

final class MovieRequest {
    
    private let queryParameters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseMovieUrl
        string += "?"
        let apiKeyQueryItem = URLQueryItem(name: "api_key", value: Constants.apiKey)
        let languageQueryItem = URLQueryItem(name: "language", value: Constants.getLanguage(language: .eng))
        var argumentQueryParameters = [apiKeyQueryItem, languageQueryItem]
        
        if !queryParameters.isEmpty {
            argumentQueryParameters.append(contentsOf: queryParameters)
        }
        
        let argumentString = argumentQueryParameters.compactMap({
            guard let value = $0.value else { return nil }
            return "\($0.name)=\(value)"
        }).joined(separator: "&")
        
        string += argumentString
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    public init(queryParameters: [URLQueryItem] = []) {
        self.queryParameters = queryParameters
    }
}
