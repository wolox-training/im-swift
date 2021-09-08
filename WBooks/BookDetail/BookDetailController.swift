//
//  BookDetailController.swift
//  WBooks
//
//  Created by ignacio.mendez on 13/08/2021.
//

import UIKit

class BookDetailController: UIViewController {
    
    private var bookDetailViewModel: BookDetailViewModel
    
    init(bookDetailViewModel: BookDetailViewModel) {
        self.bookDetailViewModel = bookDetailViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var bookDetailView: BookDetailView = BookDetailView()
    
    override func loadView() {
        view = bookDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configuration SubView
        bookDetailView.config(title: bookDetailViewModel.book.title, year: bookDetailViewModel.book.year, genre: bookDetailViewModel.book.genre, author: bookDetailViewModel.book.author, status: bookDetailViewModel.book.status, image: bookDetailViewModel.book.image)
        
        //setupRentButton
        setupRentButtonNotavailable()
    }
    
    private func setupRentButtonNotavailable() {
        bookDetailView.buttonRent.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        if bookDetailViewModel.status() == "Not available" {
            // create the alert
            let message = NSLocalizedString("MESSAGE_ALERT", comment: "Message alert")
            let alert = UIAlertController(title: "!", message: message, preferredStyle: UIAlertController.Style.alert)
            // add an action(button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        } else {
            print("api request")
            bookDetailViewModel.postRent()
        }
    }
}
