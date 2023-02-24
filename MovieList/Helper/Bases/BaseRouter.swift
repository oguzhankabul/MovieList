//
//  BaseRouter.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import UIKit

protocol RouterProtocol {
    associatedtype V: UIViewController
    
    var viewController: V? { get }
    
    func open(_ viewController: UIViewController, transition: Transition)
}

class Router: RouterProtocol {
    
    weak var viewController: UIViewController?
    var openTransition: Transition?

    func open(_ viewController: UIViewController, transition: Transition) {
        transition.viewController = self.viewController
        transition.open(viewController)
    }
    
    deinit {
        debugPrint("deinit: \(self)")
    }
}
