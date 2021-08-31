//
//  Utilities.swift
//  WBooks
//
//  Created by ignacio.mendez on 11/08/2021.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) -> URLSessionDataTask {
        contentMode = mode
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }
        
        task.resume()
        return task
    }
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) -> URLSessionDataTask? {
        guard let url = URL(string: link) else { return nil }
        return downloaded(from: url, contentMode: mode)
    }
    
    func setRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.contentMode = UIView.ContentMode.scaleAspectFill
    }
}
