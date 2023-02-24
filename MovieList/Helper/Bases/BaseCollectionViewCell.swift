//
//  BaseCollectionViewCell.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import UIKit

open class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupViews()
        setupLayout()
    }
    
    open func setupViews() {
        backgroundColor = .clear
    }
    
    open func setupLayout() {}
    
}

extension BaseCollectionViewCell: Reuse {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public protocol Reuse: AnyObject {
    static var reuseIdentifier: String { get }
}

