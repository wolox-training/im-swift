//
//  LoginViewPro.swift
//  WBooks
//
//  Created by ignacio.mendez on 10/09/2021.
//

import Foundation
import UIKit

final class LoginViewPro: UIView {
    
    //image background
    private lazy var imageBackground: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bc_inicio")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //WBOOKS image
    private lazy var  imageWbooks: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Group")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //login button
    lazy var buttonGoogle: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont(name: "SFUIText-Heavy", size: 19)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        btn.setTitle("INGRESAR CON GOOGLE", for: .normal)
        btn.tintColor = .white
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 22
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = UIColor.white.cgColor
        return btn
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        [imageBackground, imageWbooks, buttonGoogle] .forEach { view in
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            imageBackground.topAnchor.constraint(equalTo: topAnchor),
            imageBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageWbooks.widthAnchor.constraint(equalToConstant: 120),
            imageWbooks.heightAnchor.constraint(equalToConstant: 120),
            imageWbooks.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            imageWbooks.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -100),
            
            buttonGoogle.widthAnchor.constraint(equalToConstant: 250),
            buttonGoogle.heightAnchor.constraint(equalToConstant: 44),
            buttonGoogle.topAnchor.constraint(equalTo: imageWbooks.bottomAnchor, constant: 50),
            buttonGoogle.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}

