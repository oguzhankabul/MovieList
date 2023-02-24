//
//  MovieDetailViewModel.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import Foundation

final class MovieDetailViewModel: BaseViewModel<MovieDetailRouter> {
    
    private let movie: Movie
    
    init(router: MovieDetailRouter, movie: Movie) {
        self.movie = movie
        super.init(router: router)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getTagViewModelList() -> [TagViewModel] {
        var tagViewModelList: [TagViewModel] = []
        if let originalLanguage = movie.originalLanguage {
            tagViewModelList.append(TagViewModel(title: originalLanguage))
        }
        if let originCountry = movie.originCountry?.first {
            tagViewModelList.append(TagViewModel(title: originCountry))
        }
        if let firstAirDate = movie.firstAirDate {
            let year = firstAirDate.components(separatedBy: "-").first
            if let year = year {
                tagViewModelList.append(TagViewModel(title: year))
            }
        }
        if let voteAverage = movie.voteAverage?.toString() {
            tagViewModelList.append(TagViewModel(title: voteAverage))
        }
        return tagViewModelList
    }
    
    func getImage() -> String? {
        return movie.posterPath
    }
    
    func getNameLabel() -> String {
        return movie.originalName ?? ""
    }
    
    func getOverviewLabel() -> String {
        return movie.overview ?? ""
    }
    
}
