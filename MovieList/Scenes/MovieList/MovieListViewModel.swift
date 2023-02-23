//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import Foundation

final class MovieListViewModel: BaseViewModel<MovieListRouter> {
    
    override init(router: MovieListRouter) {
        super.init(router: router)
    }
    
}

// MARK: - Navigate
extension MovieListViewModel {
    
    func pushdetail() {
        router.pushMovieDetail()
    }
}


// MARK: - Request


