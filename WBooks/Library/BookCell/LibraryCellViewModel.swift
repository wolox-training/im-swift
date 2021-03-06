//
//  MyCustomCellViewModel.swift
//  WBooks
//
//  Created by ignacio.mendez on 06/08/2021.
//

import Foundation

struct LibraryCellViewModel {
    
    let book: Book
    
    var title: String {
        return book.title
    }
    
    var author: String {
        return book.author
    }
    
    var image: String {
        return book.image
    }    
}

