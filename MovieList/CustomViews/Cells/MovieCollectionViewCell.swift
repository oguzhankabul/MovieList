//
//  MovieCollectionViewCell.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import UIKit
import TinyConstraints

final class MovieCollectionViewCell: BaseCollectionViewCell, ReusableView  {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .primaryTitleFont
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let raitingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .secondaryTitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public override func setupViews() {
        super.setupViews()
        contentView.addSubviews([imageView, nameLabel, raitingLabel])
    }
    
    public override func setupLayout() {
        super.setupLayout()
        addConstraints()
        setUpLayer()
    }
    
    private func setUpLayer() {
        contentView.layer.cornerRadius = .bottomHalfOffset
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.cornerRadius = .quarterOffset
        contentView.layer.shadowOffset = CGSize(width: .bottomQuarterOffset, height: .quarterOffset)
        contentView.layer.shadowOpacity = .primaryShadowOpacity
        contentView.backgroundColor = .secondarySystemBackground
    }
    
    private func addConstraints() {
        imageView.edgesToSuperview(excluding: .bottom)
        
        nameLabel.topToBottom(of: imageView, offset: .halfOffset)
        nameLabel.leadingToSuperview(offset: .quarterOffset)
        nameLabel.trailingToSuperview(offset: .quarterOffset)
        
        raitingLabel.topToBottom(of: nameLabel, offset: .halfOffset)
        raitingLabel.leadingToSuperview(offset: .quarterOffset)
        raitingLabel.trailingToSuperview(offset: .quarterOffset)
        raitingLabel.bottomToSuperview(offset: .bottomHalfOffset)
    }
    
    public func set(_ cellModel: MovieCollectionViewCellModel) {
        nameLabel.text = cellModel.name
        raitingLabel.text = cellModel.raiting
        imageView.setImage(with: cellModel.imageUrl)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        raitingLabel.text = nil
    }
}
