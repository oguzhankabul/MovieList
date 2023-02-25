//
//  MovieListTests.swift
//  MovieListTests
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import XCTest
@testable import MovieList

final class MovieListViewModelTest: XCTestCase {
    
    var vm: MovieListViewModel? = nil
    var movieServiceMock: MoviesServiceMock? = nil

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = MovieListViewModel(router: MovieListRouter())
        movieServiceMock = MoviesServiceMock()
    }
    
    func testMovieServiceMock_isMovieListModelWorkingCorrectly_mustBeEqual() {
        /// Arrange
        let firstMockMovie = Movie(backdropPath: "/uDgy6hyPd82kOHh6I95FLtLnj6p.jpg",
                                   firstAirDate: "2023-01-15",
                                   genreIDS: [18,10759],
                                   id: 100088,
                                   name: "The Last of Us",
                                   originCountry: ["US"],
                                   originalLanguage: "en",
                                   originalName: "The Last of Us",
                                   overview: "Twenty years after modern civilization has been destroyed, Joel, a hardened survivor, is hired to smuggle Ellie, a 14-year-old girl, out of an oppressive quarantine zone. What starts as a small job soon becomes a brutal, heartbreaking journey, as they both must traverse the United States and depend on each other for survival.",
                                   popularity: 3990.183,
                                   posterPath: "/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg",
                                   voteAverage: 8.8,
                                   voteCount: 1980)
        
        /// Act
        let firstMovie = try! movieServiceMock?.fetchMovieList().get().results?.first
        
        /// Assert
        XCTAssertEqual(firstMockMovie.backdropPath, firstMovie?.backdropPath , "MovieList Model must be Equal with mockModel")
        XCTAssertEqual(firstMockMovie.firstAirDate, firstMovie?.firstAirDate , "MovieList Model must be Equal with mockModel")
        XCTAssertEqual(firstMockMovie.id, firstMovie?.id , "MovieList Model must be Equal with mockModel")
        XCTAssertEqual(firstMockMovie.name, firstMovie?.name , "MovieList Model must be Equal with mockModel")
        XCTAssertEqual(firstMockMovie.originCountry, firstMovie?.originCountry , "MovieList Model must be Equal with mockModel")
        XCTAssertEqual(firstMockMovie.originalLanguage, firstMovie?.originalLanguage , "MovieList Model must be Equal with mockModel")
        XCTAssertEqual(firstMockMovie.originalName, firstMovie?.originalName , "MovieList Model must be Equal with mockModel")
        XCTAssertEqual(firstMockMovie.overview, firstMovie?.overview , "MovieList Model must be Equal with mockModel")
        XCTAssertEqual(firstMockMovie.popularity, firstMovie?.popularity , "MovieList Model must be Equal with mockModel")
        XCTAssertEqual(firstMockMovie.posterPath, firstMovie?.posterPath , "MovieList Model must be Equal with mockModel")
        XCTAssertEqual(firstMockMovie.voteAverage, firstMovie?.voteAverage , "MovieList Model must be Equal with mockModel")
        XCTAssertEqual(firstMockMovie.voteCount, firstMovie?.voteCount , "MovieList Model must be Equal with mockModel")
    }
    
    func testFetchMovieList_isViewModelPropertiesWorkingCorrectly_mustBeEqual() {
        /// Arrange
        
        /// Act
        vm?.fetchMovieList()
        
        /// Assert
        XCTAssertEqual(vm?.isLoadingMoreMovie, true , "Before fetching isLoadingMoreMovie must be true")
        XCTAssertEqual(vm?.nextMoviePage, 1 , "Before fetching nextMoviePage must be 1")
        XCTAssertEqual(vm?.shouldShowLoadMoreIndicator, false , "Before fetching nextMoviePage must be false")
        XCTAssertEqual(vm?.moviewCollectionCellModelList.isEmpty, true , "Before fetching moviewCollectionCellModelList must be empty")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vm = nil
        movieServiceMock = nil
    }

    override class func tearDown() {
        //It is called after all methods complete.
        super.tearDown()
    }
}

final class MoviesServiceMock: Mockable {
    func fetchMovieList() -> (Result<MovieList, Error>) {
        return .success(loadJSON(filename: "movie_list_response", type: MovieList.self))
    }
}

