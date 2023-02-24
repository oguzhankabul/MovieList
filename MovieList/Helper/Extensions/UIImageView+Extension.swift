//
//  UIImageView+Extension.swift
//  MovieList
//
//  Created by Oğuzhan Kabul on 24.02.2023.
//

import UIKit

extension UIImageView {
    
    func setImage(with endpoint: String?) {
        
        guard let endpoint = endpoint else {
            self.image = .remove
            return
        }
        
        let urlString = "https://image.tmdb.org/t/p/w185"+endpoint
        
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                if data == data, error == nil {
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                } else {
                    self.image = .remove
                }
            }
            
            task.resume()
        }
    }
}
