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
    
    var book_id: Int {
        return comment.book_id
    }
    
    var user_id: Int {
        return comment.user_id
    }
    
    var content: String {
        return comment.content
    }
    
}


