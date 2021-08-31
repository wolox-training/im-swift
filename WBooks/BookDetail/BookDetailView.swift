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
        didSet{
            buttonAddtoWishList.backgroundColor = .clear
            buttonAddtoWishList.layer.cornerRadius = 30
            buttonAddtoWishList.layer.borderWidth = 1.5
            buttonAddtoWishList.layer.borderColor = UIColor.systemBlue.cgColor
        }
    }
    
    @IBOutlet weak var buttonRent: UIButton! {
        didSet{
            buttonRent.backgroundColor = .clear
            buttonRent.layer.cornerRadius = 30
            buttonRent.layer.borderWidth = 1.5
            buttonRent.layer.borderColor = UIColor.systemBlue.cgColor
        }
    }
}
