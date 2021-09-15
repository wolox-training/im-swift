//
//  LoginControllerPro.swift
//  WBooks
//
//  Created by ignacio.mendez on 10/09/2021.
//

import Foundation
import UIKit

final class LoginControllerPro: UIViewController {
    
    private lazy var loginViewPro: LoginViewPro = LoginViewPro()
    
    override func loadView() {
        view = loginViewPro
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGoogleButton()
    }
    
    private func setupGoogleButton() {
        loginViewPro.buttonGoogle.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        
        let tabBarVC = TabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
}
