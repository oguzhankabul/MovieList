//
//  UIFont+Extension.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import UIKit

extension UIFont {
    
    static var primaryTitleFont: UIFont {
        return .systemFont(ofSize: 18, weight: .medium)
    }
    
    static var secondaryTitleFont: UIFont {
        return .systemFont(ofSize: 16, weight: .regular)
    }
    
    static var primaryDescriptionFont: UIFont {
        return .systemFont(ofSize: 16, weight: .black)
    }
}
