//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import Foundation

final class MovieListViewModel: BaseViewModel<MovieListRouter> {
    
    var moviewCollectionCellModelList: [MovieCollectionViewCellModel] = []
    var movieList: [Movie] = []
    var reloadData: VoidClosure = { }
    var shouldShowLoadMoreIndicator = false
    var isLoadingMoreMovie = false
    var nextMoviePage: Int = 1
    
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
    
    func pushMovieDetail(movie: Movie) {
        router.pushMovieDetail(movie: movie)
    }
}


// MARK: - Request
extension MovieListViewModel {
    
    func fetchMovieList() {
        guard !isLoadingMoreMovie else {
            return
        }
        isLoadingMoreMovie = true
        let stringPageValue = nextMoviePage.toString
        let movieRequest = MovieRequest(queryParameters: [URLQueryItem(name: "page", value: stringPageValue)])
        MovieService.shared.execute(movieRequest, expecting: MovieList.self) { result in
            switch result {
            case .success(_):
                let _ = result.map { movieList in
                    self.shouldShowLoadMoreIndicator = movieList.page == movieList.totalPages ? false : true
                    movieList.results?.forEach({ movie in
                        self.movieList.append(movie)
                        let movieCollectionViewCellModel = MovieCollectionViewCellModel(imageUrl: movie.posterPath, name: movie.name, raiting: movie.voteAverage)
                        self.moviewCollectionCellModelList.append(movieCollectionViewCellModel)
                    })
                    DispatchQueue.main.async {
                        self.reloadData()
                    }
                }
                self.nextMoviePage += 1
                self.isLoadingMoreMovie = false
            case .failure(let error):
                print(String(describing: error))
                self.isLoadingMoreMovie = false
            }
        }
    }
}


