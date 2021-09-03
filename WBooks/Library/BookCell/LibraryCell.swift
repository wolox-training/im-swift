//
//  MyCustomCell.swift
//  WBooks
//
//  Created by Nacho Mendez on 04/08/2021.
//

import UIKit

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
