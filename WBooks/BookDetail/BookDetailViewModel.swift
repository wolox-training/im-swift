//
//  BookDetailViewModel2.swift
//  WBooks
//
//  Created by ignacio.mendez on 13/08/2021.
//

import Foundation

struct BookDetailViewModel {

    var book: Book

    var id: Int {
        return book.id
    }

    var title: String {
        return book.title
    }

    var author: String {
        return book.author
    }

    var image: String {
        return book.image
    }

    var status: String {
        return book.status
    }

    var year: String {
        return book.year
    }

    var genre: String {
        return book.genre
    }

}
