//
//  MovieListFooterLoadingCollectionReusableView.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import UIKit
import TinyConstraints

final class MovieListFooterLoadingCollectionReusableView: UICollectionReusableView {
    static let identifier = "MovieListFooterLoadingCollectionReusableView"

    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(spinner)
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    private func addConstraints() {
        spinner.size(.spinnerSize)
        spinner.centerInSuperview()
    }

    public func startAnimating() {
        spinner.startAnimating()
    }
}
