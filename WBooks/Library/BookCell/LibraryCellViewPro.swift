////
////  LibraryCellViewPro.swift
////  WBooks
////
////  Created by ignacio.mendez on 11/09/2021.
////
//import Foundation
//import UIKit
//
//
//final class LibraryCellViewPro: UITableViewCell {
//    
//    //imageView
//    lazy var videoImageView: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.layer.cornerRadius = 10
//        image.clipsToBounds = true
//        return image
//    }()
//    
//    //label title
//    lazy var videoTitleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        label.adjustsFontSizeToFitWidth = true
//        return label
//    }()
//    
//    //label author
//    lazy var authorLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        label.adjustsFontSizeToFitWidth = true
//        return label
//    }()
//    
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupView()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupView() {
//        
//        [videoImageView, videoTitleLabel, authorLabel] .forEach { view in
//            addSubview(view)
//        }
//        
//        NSLayoutConstraint.activate([
//            
//            videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
//            videoImageView.heightAnchor.constraint(equalToConstant: 80),
//            videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9),
//            
//            videoTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//            videoTitleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20),
//            videoTitleLabel.heightAnchor.constraint(equalToConstant: 80),
//            videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
//            
//            authorLabel.topAnchor.constraint(equalTo: videoTitleLabel.bottomAnchor, constant: 10),
//            videoTitleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20),
//            videoTitleLabel.heightAnchor.constraint(equalToConstant: 80),
//            videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
//            
//            
//        ])
//    }
//}
