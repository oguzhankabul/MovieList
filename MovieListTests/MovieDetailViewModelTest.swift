//
//  MovieDetailViewModelTest.swift
//  MovieListTests
//
//  Created by Oğuzhan Kabul on 25.02.2023.
//

import XCTest
@testable import MovieList

final class MovieDetailViewModelTest: XCTestCase {
    
    var vm: MovieDetailViewModel? = nil
    var mockMovie: Movie? = nil

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockMovie = Movie(backdropPath: "/uDgy6hyPd82kOHh6I95FLtLnj6p.jpg",
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
        let mockMoviePresentation = MoviePresentation(movie: mockMovie!)
        vm = MovieDetailViewModel(router: MovieDetailRouter(), movie: mockMoviePresentation)
    }
    
    func testModelList_TagModelListCountMustBe4_mustBeEqual() {
        /// Arrange
        /// Act
        /// Assert
        XCTAssertEqual(vm?.getTagViewModelList().count, 4 , "Tag Model List Must Be Return 4 Tag Model")
    }
    
    func testModelList_VMProperties_mustBeEqual() {
        /// Arrange
        /// Act
        /// Assert
        XCTAssertEqual(vm?.getOverviewLabel(), mockMovie?.overview)
        XCTAssertEqual(vm?.getNameLabel(), mockMovie?.name)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vm = nil
        mockMovie = nil
    }

    override class func tearDown() {
        //It is called after all methods complete.
        super.tearDown()
    }
}
