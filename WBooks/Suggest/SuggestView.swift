//
//  SuggestView.swift
//  WBooks
//
//  Created by ignacio.mendez on 01/09/2021.
//

import Foundation
import UIKit



final class SuggestView: NibView {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var fieldName: UITextField!
    @IBOutlet weak var fieldAuthor: UITextField!
    @IBOutlet weak var fieldYear: UITextField!
    @IBOutlet weak var fieldTopic: UITextField!
    @IBOutlet weak var fieldDescription: UITextField!
    @IBOutlet weak var buttonSubmit: UIButton!{
        didSet{
            buttonSubmit.applyGradient()
            buttonSubmit.setTitleColor(.white, for: .normal)
        }
    }
}
