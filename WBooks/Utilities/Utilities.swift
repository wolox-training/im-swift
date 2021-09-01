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

extension UIButton{
    func applyGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor(red: 0, green: 0.68, blue: 0.93, alpha: 1).cgColor,
                                UIColor(red: 0.22, green: 0.8, blue: 0.8, alpha: 1).cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.06, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 30
        self.layer.insertSublayer(gradientLayer, at: 0)
        setTitleColor(.white, for: .normal)
    }
}

