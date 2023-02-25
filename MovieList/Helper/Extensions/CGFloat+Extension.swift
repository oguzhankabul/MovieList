//
//  CGFloat+Extension.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import Foundation

extension CGFloat {
    
    // MARK: - Paddings
    static var baseOffset: CGFloat {
        return 16
    }
    
    static var halfOffset: CGFloat {
        return 8
    }
    
    static var quarterOffset: CGFloat {
        return 4
    }
    
    static var bottomBaseOffset: CGFloat {
        return -16
    }
    
    static var bottomHalfOffset: CGFloat {
        return -8
    }
    
    static var bottomQuarterOffset: CGFloat {
        return -4
    }
    
    // MARK: - ScaleFactors
    static var primaryMinimumScaleFactor: CGFloat {
        return 0.8
    }
}
