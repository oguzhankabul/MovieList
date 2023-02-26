//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import Foundation

final class MovieListViewModel: BaseViewModel<MovieListRouter> {
    
    private var movieList: [MoviePresentation] = []
    var moviewCollectionCellModelList: [MovieCollectionViewCellModel] = []
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
    
    func pushMovieDetail(indexPath: IndexPath) {
        router.pushMovieDetail(movie: movieList[indexPath.row])
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
            case .success(let data):
                self.shouldShowLoadMoreIndicator = data.page == data.totalPages ? false : true
                data.results?.forEach { movie in
                    let moviePresentation = MoviePresentation(movie: movie)
                    self.movieList.append(moviePresentation)
                    let movieCollectionViewCellModel = MovieCollectionViewCellModel(image: moviePresentation.movieImage,
                                                                                    name: moviePresentation.originalName,
                                                                                    raiting: moviePresentation.voteAverage)
                    self.moviewCollectionCellModelList.append(movieCollectionViewCellModel)
                }
                DispatchQueue.main.async {
                    self.reloadData()
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
