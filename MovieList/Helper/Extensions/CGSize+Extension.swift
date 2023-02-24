//
//  CGSize+Extension.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import UIKit

extension CGSize {
    
    static var spinnerSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    static var movieCollectionViewCellSize: CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width*2)
    }
}
