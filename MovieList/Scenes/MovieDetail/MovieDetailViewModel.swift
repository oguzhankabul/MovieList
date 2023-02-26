//
//  MovieDetailViewModel.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import UIKit

final class MovieDetailViewModel: BaseViewModel<MovieDetailRouter> {
    
    private let movie: MoviePresentation
    
    init(router: MovieDetailRouter, movie: MoviePresentation) {
        self.movie = movie
        super.init(router: router)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getTagViewModelList() -> [TagViewModel] {
        var tagViewModelList: [TagViewModel] = []
        movie.detailTagList.forEach { tag in
            tagViewModelList.append(TagViewModel(title: tag))
        }
        return tagViewModelList
    }
    
    func getImage() -> UIImage {
        return movie.movieImage
    }
    
    func getNameLabel() -> String {
        return movie.originalName
    }
    
    func getOverviewLabel() -> String {
        return movie.overview
    }
    
}
