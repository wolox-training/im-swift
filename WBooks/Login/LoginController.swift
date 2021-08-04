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
        
        loginView.buttonGoogle.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        let controller = UINavigationController(rootViewController: LibraryController())
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
        
//        let libraryController = LibraryController()
//        present(UINavigationController(rootViewController: libraryController), animated: true)
//        navigationController?.pushViewController(libraryController, animated: true)
    }
}
