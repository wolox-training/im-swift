//
//  MyCustomCell.swift
//  WBooks
//
//  Created by Nacho Mendez on 04/08/2021.
//

import UIKit
//import Alamofire
//import AlamofireImage


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
}

class LibraryCell: UITableViewCell {
    
    @IBOutlet weak var lblFirst: UILabel!
    @IBOutlet weak var lblSecond: UILabel!
    @IBOutlet weak var imageBook: UIImageView!
    
    private var imageTask: URLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageTask?.cancel()
        imageTask = nil
        imageBook.image = nil
    }
    
    func configureCell(with viewModel: LibraryCellViewModel) {
        lblFirst.text = viewModel.title
        lblSecond.text = viewModel.author
        imageTask = imageBook.downloaded(from: viewModel.image)
    }
}
