//
//  BookDetailView2.swift
//  WBooks
//
//  Created by ignacio.mendez on 13/08/2021.
//

import Foundation
import UIKit

final class BookDetailView: NibView {
    
    @IBOutlet var viewDetail: UIView!{
        didSet{
            viewDetail.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var titleBook: UILabel!
    @IBOutlet weak var yearBook: UILabel!
    @IBOutlet weak var genreBook: UILabel!
    @IBOutlet weak var authorBook: UILabel!
    @IBOutlet weak var statusBook: UILabel!
    
    
    @IBOutlet weak var buttonAddtoWishList: UIButton! {
        didSet {
            buttonAddtoWishList.backgroundColor = .clear
            buttonAddtoWishList.layer.cornerRadius = 22
            buttonAddtoWishList.layer.borderWidth = 1.5
            buttonAddtoWishList.layer.borderColor = UIColor.systemBlue.cgColor
        }
    }
    
    @IBOutlet weak var buttonRent: UIButton! {
        didSet {
            buttonRent.setTitleColor(.white, for: .normal)
        }
    }
    
    func config(title: String, year: String, genre: String, author: String, status: String, image: String) {
        
        titleBook.text = title
        authorBook.text = author
        yearBook.text = year
        genreBook.text = genre
        
        _ = imageBook.downloaded(from: image)
        
        if status == "Available" {
            statusBook.text = status
            statusBook.textColor = UIColor.systemGreen
        } else {
            statusBook.text = status
        }
        
        if status == "Not available" {
            buttonRent.backgroundColor = UIColor.gray
            buttonRent.setTitleColor(.white, for: .normal)
            buttonRent.layer.borderColor = UIColor.white.cgColor
            
        } else {
            buttonRent.isEnabled = true
            buttonRent.applyGradient()
        }
    }
}
