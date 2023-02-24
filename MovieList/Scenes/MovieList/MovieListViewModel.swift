//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import Foundation

final class MovieListViewModel: BaseViewModel<MovieListRouter> {
    
    var moviewCollectionCellModelList: [MovieCollectionViewCellModel] = []
    var reloadData: VoidClosure = { }
    
    override init(router: MovieListRouter) {
        super.init(router: router)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovieList()
    }
    
}

// MARK: - Navigate
extension MovieListViewModel {
    
    func pushdetail() {
        router.pushMovieDetail()
    }
}


// MARK: - Request
extension MovieListViewModel {
    func fetchMovieList() {
        let movieRequest = MovieRequest(queryParameters: [URLQueryItem(name: "page", value: "1")])
        MovieService.shared.execute(movieRequest, expecting: MovieList.self) { result in
            switch result {
            case .success(_):
                let _ = result.map { movieList in
                    movieList.results?.forEach({ movie in
                        let movieCollectionViewCellModel = MovieCollectionViewCellModel(imageUrl: movie.posterPath, name: movie.name, raiting: movie.voteAverage)
                        self.moviewCollectionCellModelList.append(movieCollectionViewCellModel)
                    })
                    DispatchQueue.main.async {
                        self.reloadData()
                    }
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}


