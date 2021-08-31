//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by ignacio.mendez on 06/08/2021.
//

import Foundation

class LibraryViewModel {
    
    var books = [Book]()
    let api = BookRepository()
    
    func getBookRepo(action: @escaping ([Book]) -> () ) {
        let onSuccess = { (books: [Book]) in
            self.books = books
            action(books)
        }
        let onError = { error in
            print(error)
        }
        api.fetchBooks(onSuccess: onSuccess, onError: onError)
    }
    
    func numberOfBooks() -> Int {
        return books.count
    }
    
    func getCellViewModel(index: Int) -> LibraryCellViewModel {
        let myCustomCellViewModel = LibraryCellViewModel(book: books[index])
        return myCustomCellViewModel
    }
    
    func getBookDetailPadreViewModel(index: Int) -> BookDetailPadreViewModel {
        let myCustomBookDetailPadreViewModel = BookDetailPadreViewModel(book: books[index])
        return myCustomBookDetailPadreViewModel
    }
    
    
}
