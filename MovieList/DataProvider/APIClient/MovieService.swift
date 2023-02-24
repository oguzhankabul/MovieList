//
//  Service.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import Foundation

final class MovieService {
    
    static let shared = MovieService()
    
    private init() {}
    
    private enum MovieServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    public func execute<T: Codable>( _ request: MovieRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(MovieServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? MovieServiceError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func request(from movieRequest: MovieRequest) -> URLRequest? {
        guard let url = movieRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = movieRequest.httpMethod
        return request
    }
}
