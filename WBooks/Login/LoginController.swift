//
//  LoginController.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 03/08/2021.
//

import Foundation
import UIKit

final class LoginController: UIViewController {
    
    private lazy var loginView: LoginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
