//
//  BookDetailController.swift
//  WBooks
//
//  Created by ignacio.mendez on 10/08/2021.
//

import UIKit

class BookDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var bookDetailViewModel: BookDetailViewModel!
    
    
    private let commentViewModel = CommentViewModel()
    
    private lazy var bookDetailView: BookDetailView = BookDetailView()
    
    override func loadView() {
        view = bookDetailView
    }
    
    // Remove tabBar
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavigationBar
        configurationNavigationBar()
        configurationFirstStack()
        setupRentButtonNotavailable()
        
        // delegates and data source from table
        bookDetailView.tableComments.delegate = self
        bookDetailView.tableComments.dataSource = self
        
        // cell .xib forom table
        let nib = UINib(nibName: "CommentCell", bundle: nil)
        bookDetailView.tableComments.register(nib, forCellReuseIdentifier: "CommentCell")
        
        // reload table view
        commentViewModel.id = bookDetailViewModel.id
        commentViewModel.getCommentRepo { comments in
            self.bookDetailView.tableComments.reloadData()
        }
    }
    
    // Set the navBar title and arrow white
    func configurationNavigationBar() {
        title = "BOOK DETAIL"
        self.navigationController!.navigationBar.tintColor = UIColor.white
    }
    
    func configurationFirstStack() {
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
        //let bookVM = BookDetailViewModel(book: book)
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
    
    //func from table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentViewModel.numberOfComments()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
        let viewModel = commentViewModel.getCellCommentViewModel(index: indexPath.row)
        cell.configureCell(with: viewModel)
        return cell
    }
}

