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
        // Do any additional setup after loading the view.
    }

    @IBAction func enterTapped(_ sender: Any) {
        if ((!userNameField.text!.isEmpty) && (!passwordField.text!.isEmpty)) {
            print("user: \(userNameField.text!), pass: \(passwordField.text!)")
        } else {
            print("Error, name or pass are empty")
        }
        
    }
    
}

