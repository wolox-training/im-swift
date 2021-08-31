//
//  BookDetailPadreView.swift
//  WBooks
//
//  Created by ignacio.mendez on 13/08/2021.
//

import Foundation
import UIKit

final class BookDetailPadreView: NibView {
    
    @IBOutlet weak var viewDetailContainer: UIView!{
        didSet{
            viewDetailContainer.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var viewCommentsContainer: UIView!{
        didSet{
            viewCommentsContainer.layer.cornerRadius = 5
        }
    }
}



