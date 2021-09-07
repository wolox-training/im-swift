//
//  SuggestController.swift
//  WBooks
//
//  Created by ignacio.mendez on 01/09/2021.
//

import UIKit


final class SuggestController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    private lazy var suggestView: SuggestView = SuggestView()
    
    override func loadView() {
        view = suggestView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TextFields delegates
        suggestView.fieldName.delegate = self
        suggestView.fieldAuthor.delegate = self
        suggestView.fieldYear.delegate = self
        suggestView.fieldTopic.delegate = self
        suggestView.fieldDescription.delegate = self
        
        //image as button
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector (imageTapped(tapGestureRecognizer:)))
        suggestView.imageView.isUserInteractionEnabled = true
        suggestView.imageView.addGestureRecognizer(tapGestureRecognizer)
        
        // settup SubmitButton
        setupSubmitButton()
        
        // NavigationBar
        configurationNavigationBar()
    }
    
    // MARK: -func for UIImage
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        //        let tappedImage = tapGestureRecognizer.view as! UIImageView
        _ = tapGestureRecognizer.view as! UIImageView
        
        // action
        print("imagen apretada")
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        // MARK: -Alert
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
                print("Camera not available")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    // MARK: -delegates library
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        suggestView.imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // MARK: -func for the buttonSubmit
    private func setupSubmitButton() {
        suggestView.buttonSubmit.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        
        if suggestView.fieldName.filled() &&
            suggestView.fieldAuthor.filled() &&
            suggestView.fieldYear.filled() &&
            suggestView.fieldTopic.filled() &&
            suggestView.fieldDescription.filled() {
            
            let suggestViewModel = SuggestViewModel(title: suggestView.fieldName.text!, author: suggestView.fieldAuthor.text!, year: suggestView.fieldYear.text!, genre: suggestView.fieldTopic.text!)
            suggestViewModel.postBook()
            
            suggestView.fieldName.text = nil
            suggestView.fieldAuthor.text = nil
            suggestView.fieldYear.text = nil
            suggestView.fieldTopic.text = nil
            suggestView.fieldDescription.text = nil
            
        } else {
            print("vacio")
        }
    }
    
    // MARK: -delegate for the textField
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if suggestView.fieldName.filled() {
            suggestView.fieldName.ok()
        } else {
            suggestView.fieldName.bad()
        }
        
        if suggestView.fieldAuthor.filled() {
            suggestView.fieldAuthor.ok()
        } else {
            suggestView.fieldAuthor.bad()
        }
        
        if suggestView.fieldYear.filled() {
            suggestView.fieldYear.ok()
        } else {
            suggestView.fieldYear.bad()
        }
        
        if suggestView.fieldTopic.filled() {
            suggestView.fieldTopic.ok()
        } else {
            suggestView.fieldTopic.bad()
        }
        
        if suggestView.fieldDescription.filled() {
            suggestView.fieldDescription.ok()
        } else {
            suggestView.fieldDescription.bad()
        }
        
        if suggestView.fieldName.filled() &&
            suggestView.fieldAuthor.filled() &&
            suggestView.fieldYear.filled() &&
            suggestView.fieldTopic.filled() &&
            suggestView.fieldDescription.filled() {
            print("lleno")
            
        } else {
            print("vacioooo")
        }
        
        
    }
    
    // MARK: -func for the NavigationBar config
    func configurationNavigationBar() {
        
        let imageBackground = UIImage(named: "bc_nav bar")
        navigationController?.navigationBar.setBackgroundImage(imageBackground, for: .default)
        
        title = "SUGGEST"
        tabBarItem.title = "Suggest"
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // Set the navbar button back only with arrow
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}




