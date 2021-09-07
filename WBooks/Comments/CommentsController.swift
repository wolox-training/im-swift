//
//  CommentsController.swift
//  WBooks
//
//  Created by ignacio.mendez on 13/08/2021.
//

import UIKit

class CommentsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var commentViewModel: CommentViewModel
    
    init(commentViewModel: CommentViewModel) {
        self.commentViewModel = commentViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var commentsView: CommentsView = CommentsView()
    
    override func loadView() {
        view = commentsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegates and data source from table
        commentsView.tableComments.delegate = self
        commentsView.tableComments.dataSource = self
        
        // cell .xib forom table
        let nib = UINib(nibName: "CommentCell", bundle: nil)
        commentsView.tableComments.register(nib, forCellReuseIdentifier: "CommentCell")
        
        // reload table view
        commentViewModel.getCommentRepo { comments in
            self.commentsView.tableComments.reloadData()
        }
    }
    
    // MARK: -func from table
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
