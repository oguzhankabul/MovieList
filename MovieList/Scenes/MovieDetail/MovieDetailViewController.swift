//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 23.02.2023.
//

import UIKit
import TinyConstraints

class MovieDetailViewController: BaseViewController<MovieDetailViewModel> {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .primaryTitleFont
        label.numberOfLines = 0
        return label
    }()
    
    private let tagStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        title = viewModel.getNameLabel()
        setData()
    }
    
    override func setupViews() {
        super.setupViews()
        view.addSubviews([imageView, overviewLabel, tagStackView])
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        imageView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        
        overviewLabel.topToBottom(of: imageView, offset: .baseOffset)
        overviewLabel.leadingToSuperview(offset: .halfOffset)
        overviewLabel.trailingToSuperview(offset: .halfOffset)
        
        tagStackView.topToBottom(of: overviewLabel, offset: .halfOffset)
        tagStackView.leadingToSuperview(offset: .halfOffset)
        tagStackView.trailingToSuperview(offset: .halfOffset)
        tagStackView.bottomToSuperview(usingSafeArea: true)
    }
    
    private func setData() {
        imageView.setImage(with: viewModel.getImage())
        overviewLabel.text = viewModel.getOverviewLabel()
        viewModel.getTagViewModelList().forEach { tagVm in
            let tagView = TagView()
            tagView.set(tagVm)
            tagStackView.addArrangedSubview(tagView)
        }
    }
}
