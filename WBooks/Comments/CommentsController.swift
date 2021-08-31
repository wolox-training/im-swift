//
//  CommentsController.swift
//  WBooks
//
//  Created by ignacio.mendez on 13/08/2021.
//

import UIKit

class CommentsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let commentViewModel = CommentViewModel()
    
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
