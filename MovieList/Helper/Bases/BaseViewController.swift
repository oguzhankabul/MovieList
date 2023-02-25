//
//  BaseViewController.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import UIKit
import TinyConstraints

class BaseViewController<V: BaseViewModelProtocol>: UIViewController {
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        navigationController?.navigationBar.tintColor = .label
        setupViews()
        setupLayouts()
    }
    
    func animate() {
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    deinit {
        debugPrint("deinit: \(self)")
    }
    
    // MARK: - SetupViews
    func setupViews() {}
    
    // MARK: - SetupLayouts
    func setupLayouts() {}
}
