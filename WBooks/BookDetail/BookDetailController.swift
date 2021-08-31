//
//  BookDetailController.swift
//  WBooks
//
//  Created by ignacio.mendez on 13/08/2021.
//

import UIKit

class BookDetailController: UIViewController {
    
    var bookDetailViewModel: BookDetailViewModel!
    
    private lazy var bookDetailView: BookDetailView = BookDetailView()
    
    override func loadView() {
        view = bookDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configuration SubView
        configurationDetailView2()
        
        //setupRentButton
        setupRentButtonNotavailable()
    }
    
    func configurationDetailView2() {
        bookDetailView.titleBook.text = bookDetailViewModel.book.title
        bookDetailView.authorBook.text = bookDetailViewModel.book.author
        bookDetailView.yearBook.text = bookDetailViewModel.book.year
        bookDetailView.genreBook.text = bookDetailViewModel.book.genre
        _ = bookDetailView.imageBook.downloaded(from: bookDetailViewModel.book.image)
        if bookDetailViewModel.book.status == "Available" {
            bookDetailView.statusBook.text = bookDetailViewModel.book.status
            bookDetailView.statusBook.textColor = UIColor.systemGreen
        } else {
            bookDetailView.statusBook.text = bookDetailViewModel.book.status
        }
        
        if bookDetailViewModel.book.status == "Not available" {
            bookDetailView.buttonRent.backgroundColor = UIColor.gray
            bookDetailView.buttonRent.setTitleColor(.white, for: .normal)
            bookDetailView.buttonRent.layer.borderColor = UIColor.white.cgColor
            
        } else {
            bookDetailView.buttonRent.isEnabled = true
            bookDetailView.buttonRent.backgroundColor = UIColor.systemBlue
            bookDetailView.buttonRent.setTitleColor(.white, for: .normal)
            bookDetailView.buttonRent.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    private func setupRentButtonNotavailable() {
        bookDetailView.buttonRent.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        if bookDetailViewModel.status == "Not available" {
            // create the alert
            let alert = UIAlertController(title: "!", message: "This book isn't available", preferredStyle: UIAlertController.Style.alert)
            // add an action(button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        } else {
            print("api request")
        }
    }
}
