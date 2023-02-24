//
//  BaseView.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import UIKit

open class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLayout() {}
}
