//
//  BookDetailPadreController.swift
//  WBooks
//
//  Created by ignacio.mendez on 13/08/2021.
//

import UIKit

class BookDetailContainerController: UIViewController {
    
    private var bookDetailContainerViewModel: BookDetailContainerViewModel
    
    private lazy var bookDetailContainerView: BookDetailContainerView = BookDetailContainerView()
    
    override func loadView() {
        view = bookDetailContainerView
    }
    
    // Remove tabBar
    
    init(bookDetailPadreViewModel: BookDetailContainerViewModel) {
        self.bookDetailContainerViewModel = bookDetailPadreViewModel
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bookDetailController = BookDetailController(bookDetailViewModel: bookDetailContainerViewModel.getBookDetailViewModel())
        
        let commentsController = CommentsController(commentViewModel: bookDetailContainerViewModel.getCommentViewModel())
        
        //get the first container
        add(child: bookDetailController, frame: bookDetailContainerView.viewDetailContainer.frame)
        print(bookDetailContainerViewModel.book)
        
        //get the second container
        add(child: commentsController, frame: bookDetailContainerView.viewCommentsContainer.frame)
        
        // NavigationBar
        configurationNavigationBar()
    }
    
    // MARK: -Add Subviews
    func add(child: UIViewController, frame: CGRect?) {
        addChild(child)
        if let frame = frame {
            child.view.frame = frame
        }
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    // MARK: -Set the navBar title and arrow white
    func configurationNavigationBar() {
        
        title = NSLocalizedString("TITLE_CONTAINER", comment: "Title at the top of the Library view")
        self.navigationController!.navigationBar.tintColor = UIColor.white
    }
}
