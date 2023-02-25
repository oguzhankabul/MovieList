//
//  BaseViewModel.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import UIKit

protocol BaseViewModelProtocol {
    
    func viewDidLoad()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    let router: R
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    init(router: R) {
        self.router = router
    }
    
    func viewDidLoad() {}

    deinit {
        debugPrint("deinit \(self)")
    }
}
