//
//  MovieDetailRoute.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import Foundation

protocol MovieDetailRoute {
    
    func pushMovieDetail(movie: MoviePresentation)
}

extension MovieDetailRoute where Self: RouterProtocol {
    
    func pushMovieDetail(movie: MoviePresentation) {
        let router = MovieDetailRouter()
        let viewModel = MovieDetailViewModel(router: router, movie: movie)
        let viewController = MovieDetailViewController(viewModel: viewModel)
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        open(viewController, transition: transition)
    }
}
