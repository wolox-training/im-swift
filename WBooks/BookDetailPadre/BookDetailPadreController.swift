//
//  BookDetailPadreController.swift
//  WBooks
//
//  Created by ignacio.mendez on 13/08/2021.
//

import UIKit

class BookDetailPadreController: UIViewController {
    
    var bookDetailPadreViewModel: BookDetailPadreViewModel!
    
    var bookDetailController = BookDetailController()
    
    var commentsController = CommentsController()
    
    private lazy var bookDetailPadreView: BookDetailPadreView = BookDetailPadreView()
    
    override func loadView() {
        view = bookDetailPadreView
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
        
        //get the first container
        add1(child: bookDetailController, frame: bookDetailPadreView.viewDetailContainer.frame)
        print(bookDetailPadreViewModel.book)
        
        //get the second container
        add2(child: commentsController, frame: bookDetailPadreView.viewCommentsContainer.frame)
        
        // NavigationBar
        configurationNavigationBar()
    }
    
    // MARK: -Add Subview1
    func add1(child: UIViewController, frame: CGRect?) {
        bookDetailController.bookDetailViewModel = bookDetailPadreViewModel.getBookDetailViewModel2()
        addChild(child)
        if let frame = frame {
            child.view.frame = frame
        }
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    // MARK: -Add Subview2
    func add2(child: UIViewController, frame: CGRect?) {
        commentsController.commentViewModel.id = bookDetailPadreViewModel.book.id
        addChild(child)
        if let frame = frame {
            child.view.frame = frame
        }
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    // MARK: -Set the navBar title and arrow white
    func configurationNavigationBar() {
        title = "BOOK DETAIL"
        self.navigationController!.navigationBar.tintColor = UIColor.white
    }
}
