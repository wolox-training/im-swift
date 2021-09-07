//
//  BookDetailPadreViewModel.swift
//  WBooks
//
//  Created by ignacio.mendez on 13/08/2021.
//

import Foundation

class BookDetailContainerViewModel {
    
    var book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    func getBookDetailViewModel() -> BookDetailViewModel {
        return BookDetailViewModel(book: book)
    }
    
    func getCommentViewModel() -> CommentViewModel {
        return CommentViewModel(id: book.id)
    }
    
}
