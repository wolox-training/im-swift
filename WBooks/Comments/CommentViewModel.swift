//
//  CommentsViewModel2.swift
//  WBooks
//
//  Created by ignacio.mendez on 13/08/2021.
//

import Foundation

class CommentViewModel {
    
    var id: Int!
    
    var comments = [Comment]()
    let api = CommentRepository()
    
    func getCommentRepo(action: @escaping ([Comment]) -> () ) {
        let onSuccess = { (comments: [Comment]) in
            self.comments = comments
            action(comments)
        }
        let onError = { error in
            print(error)
        }
        api.fetchComment(id: id, onSuccess: onSuccess, onError: onError)
    }
    
    func numberOfComments() -> Int {
        return comments.count
    }
    
    func getCellCommentViewModel(index: Int) -> CommentCellViewModel {
        let myCustomCommentCellViewModel = CommentCellViewModel(comment: comments[index])
        return myCustomCommentCellViewModel
    }
}
