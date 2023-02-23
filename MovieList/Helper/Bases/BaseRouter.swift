//
//  BaseRouter.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import UIKit

protocol Closable {
    func close(animated: Bool, completion: VoidClosure?)
    func popToRoot()
}

protocol RouterProtocol {
    associatedtype V: UIViewController
    
    var viewController: V? { get }
    
    func open(_ viewController: UIViewController, transition: Transition)
    func setNavigationRoot(_ viewController: UIViewController, transition: Transition)
}

class Router: RouterProtocol, Closable {
    
    weak var viewController: UIViewController?
    var openTransition: Transition?

    func open(_ viewController: UIViewController, transition: Transition) {
        transition.viewController = self.viewController
        transition.open(viewController)
    }
    
    func setNavigationRoot(_ viewController: UIViewController, transition: Transition) {
        transition.viewController = self.viewController
        transition.setNavigationRoot?(viewController)
    }

    func close(animated: Bool = true, completion: VoidClosure? = nil) {
        guard let openTransition = openTransition else {
            assertionFailure("You should specify an open transition in order to close a module.")
            return
        }
        guard let viewController = viewController else {
            assertionFailure("Nothing to close.")
            return
        }
        if let openModalTransition = openTransition as? ModalTransition {
            openModalTransition.isAnimated = animated
            openModalTransition.completionHandler = completion
        }
        
        if let openPushTransition = openTransition as? PushTransition {
            openPushTransition.isAnimated = animated
            openPushTransition.completionHandler = completion
        }
        
        openTransition.close(viewController)
    }
    
    func popToRoot() {
        guard let openTransition = openTransition else {
            assertionFailure("You should specify an open transition in order to close a module.")
            return
        }
        guard let viewController = viewController else {
            assertionFailure("Nothing to close.")
            return
        }
        openTransition.popToRoot?(viewController)
    }
    
    deinit {
        debugPrint("deinit: \(self)")
    }
}
