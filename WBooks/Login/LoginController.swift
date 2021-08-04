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
        
        loginView.buttonGoogle.backgroundColor = .clear
        loginView.buttonGoogle.layer.cornerRadius = 15
        
        loginView.buttonGoogle.layer.borderWidth = 1.5
        loginView.buttonGoogle.layer.borderColor = UIColor.white.cgColor
        
//        loginView.mainButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
//    @objc func buttonTapped() {
//        let libraryController = UIViewController()
//        libraryController.view.backgroundColor = .blue
//        libraryController.modalPresentationStyle = .fullScreen
//        present(libraryController, animated: true)
//    }
}
