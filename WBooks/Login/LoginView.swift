//
//  LoginView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 03/08/2021.
//

import Foundation
import UIKit

final class LoginView: NibView {
    
    @IBOutlet weak var buttonGoogle: UIButton! {
        didSet{
            buttonGoogle.backgroundColor = .clear
            buttonGoogle.layer.cornerRadius = 15
            buttonGoogle.layer.borderWidth = 1.5
            buttonGoogle.layer.borderColor = UIColor.white.cgColor
        }
    }
    
}
