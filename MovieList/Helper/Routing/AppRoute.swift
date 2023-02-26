//
//  AppRoute.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 26.02.2023.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let router = MovieListRouter()
        let vm = MovieListViewModel(router: router)
        let vc = MovieListViewController(viewModel: vm)
        router.viewController = vc
        vc.title = L10n.movie_list_title
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

let app = AppContainer()

final class AppContainer {
    let router = AppRouter()
}
