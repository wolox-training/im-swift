//
//  LibraryCellPro.swift
//  WBooks
//
//  Created by ignacio.mendez on 11/09/2021.
//

import UIKit

class LibraryCellPro: UITableViewCell {
    
    private var imageTask: URLSessionDataTask?
    
    //view for cell
    lazy var viewCell: UIView = {
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = .white
        layer.cornerRadius = 5
        clipsToBounds = true
        return view2
    }()
    
    //imageView
    lazy var bookImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    //label title
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //label author
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        [viewCell, bookImage, labelTitle, authorLabel] .forEach { view in
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            
            viewCell.topAnchor.constraint(equalTo: topAnchor),
            viewCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewCell.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            bookImage.centerYAnchor.constraint(equalTo: viewCell.centerYAnchor),
            bookImage.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 12),
            bookImage.heightAnchor.constraint(equalToConstant: 60),
            bookImage.widthAnchor.constraint(equalToConstant: 40),
            
            labelTitle.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 10),
            labelTitle.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 20),
            labelTitle.heightAnchor.constraint(equalToConstant: 20),
            labelTitle.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -12),
            
            authorLabel.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 20),
            authorLabel.heightAnchor.constraint(equalToConstant: 20),
            authorLabel.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -12)
            
        ])
    }
    
    func configureCell(with viewModel: LibraryCellViewModel) {
        labelTitle.text = viewModel.title
        authorLabel.text = viewModel.author
        imageTask = bookImage.downloaded(from: viewModel.image)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageTask?.cancel()
        imageTask = nil
        bookImage.image = nil
    }
}




