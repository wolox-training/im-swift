//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by ignacio.mendez on 06/08/2021.
//

import Foundation

class LibraryViewModel {
    
    //    var myCustomCellViewModel = MyCustomCellViewModel(book: <#Book#>)
    
    private let books = [
        Book(title: "Book1", author: "Author1"),
        Book(title: "Book2", author: "Author2"),
        Book(title: "Book3", author: "Author3"),
        Book(title: "Book4", author: "Author4"),
        Book(title: "Book5", author: "Author5"),
    ]
    
    var numberOfBook: Int {
        return books.count
    }
    
    func getCell(index: Int) -> MyCustomCellViewModel {
        let myCustomCellViewModel = MyCustomCellViewModel(book: books[index])
        return myCustomCellViewModel
    }
}
