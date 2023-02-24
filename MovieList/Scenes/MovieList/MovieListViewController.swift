//
//  ViewController.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import UIKit

class MovieListViewController: BaseViewController<MovieListViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        let movieRequest = MovieRequest(queryParameters: [URLQueryItem(name: "page", value: "1")])
        MovieService.shared.execute(movieRequest, expecting: MovieList.self) { result in
            switch result {
            case .success(let success):
                print(result)
            case .failure(let failure):
                print(failure)
            }
        }
    }


}

