//
//  BookDetailViewModel2.swift
//  WBooks
//
//  Created by ignacio.mendez on 13/08/2021.
//

import Foundation

class BookDetailViewModel {
    
    var book: Book
    
    init(book : Book) {
        self.book = book
    }
    
    func id() -> Int {
        return book.id
    }
    func title() -> String {
        return book.title
    }
    func author() -> String {
        return book.author
    }
    func image() -> String {
        return book.image
    }
    func status() -> String {
        return book.status
    }
    func year() -> String {
        return book.year
    }
    func genre() -> String {
        return book.genre
    }
    
    func postRent() {
        let dictionary = [
            
            //"id": "3",
            "user_id": "3",
            "book_id": "\(book.id)",
            "to": "2021-03-22",
            "from": "2021-03-19",
            //"created_at": "2021-03-19T15:30:06.072Z",
            //"updated_at": "2021-03-19T15:30:06.072Z"
            
        ]
        let api = PostRent(params: dictionary)
        api.post()
    }
    
    
    
    
    
}
