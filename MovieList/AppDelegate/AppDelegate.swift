//
//  AppDelegate.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        let router = MovieListRouter()
        let vm = MovieListViewModel(router: router)
        let vc = MovieListViewController(viewModel: vm)
        router.viewController = vc
        vc.navigationItem.largeTitleDisplayMode = .automatic
        vc.title = L10n.movie_list_title
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.prefersLargeTitles = true
        window?.rootViewController = nav
        return true
    }
}

