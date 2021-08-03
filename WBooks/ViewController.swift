//
//  ViewController.swift
//  WBooks
//
//  Created by Nacho Mendez on 29/07/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Probar conexión con los ConfigurationFile
//        let x: String = getVaule(from: "CFBundleName") ?? "nada"
//        print(x)
    }

    // Logica del button
    @IBAction func enterTapped(_ sender: Any) {
        if ((!userNameField.text!.isEmpty) && (!passwordField.text!.isEmpty)) {
            print("user: \(userNameField.text!), pass: \(passwordField.text!)")
        } else {
            print("Error, name or pass are empty")
        }
    }
    
    // Probar conexión con los ConfigurationFile
//    func getVaule(from key: String) -> String? {
//        return Bundle.main.infoDictionary?[key] as? String
//    }
    
}

