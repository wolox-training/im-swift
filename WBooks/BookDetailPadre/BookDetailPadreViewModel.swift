//
//  BookDetailPadreViewModel.swift
//  WBooks
//
//  Created by ignacio.mendez on 13/08/2021.
//

import Foundation

class BookDetailPadreViewModel {
    
    var book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    func getBookDetailViewModel2() -> BookDetailViewModel {
        let vm = BookDetailViewModel(book: book)
        return vm
    }
    
}
