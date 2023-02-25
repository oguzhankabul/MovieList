//
//  TagView.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import UIKit
import TinyConstraints

final class TagView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .primaryTitleFont
        label.minimumScaleFactor = .primaryMinimumScaleFactor
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(titleLabel)
        self.layer.cornerRadius = CGSize.tagSize.width/2
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.label.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .secondarySystemBackground
        self.size(.tagSize)
        setupLayout()
    }
    
    override func setupLayout() {
        super.setupLayout()
        titleLabel.topToSuperview(offset: .quarterOffset)
        titleLabel.leadingToSuperview()
        titleLabel.trailingToSuperview()
        titleLabel.bottomToSuperview(offset: .bottomQuarterOffset)
    }
    
    public func set(_ viewModel: TagViewModel) {
        titleLabel.text = viewModel.title
    }
}
