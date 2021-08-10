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
    
    
    func getCell(index: Int) -> LibraryCellViewModel {
        let myCustomCellViewModel = LibraryCellViewModel(book: books[index])
        return myCustomCellViewModel
    }
    
    func getBookRepo(action: @escaping ([Book]) -> () ) {
        
        let onSuccess = { (books: [Book]) in
            print(books)
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
}
