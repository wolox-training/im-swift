//
//  CommentCell2ViewModel.swift
//  WBooks
//
//  Created by ignacio.mendez on 31/08/2021.
//

import Foundation

struct CommentCellViewModel {
    
    let comment: Comment
    
    var id: Int {
        return comment.id
    }
    
    var bookId: Int {
        return comment.bookId
    }
    
    var userId: Int {
        return comment.userId
    }
    
    var content: String {
        return comment.content
    }
    
}


