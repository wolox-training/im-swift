//
//  SuggestViewModel.swift
//  WBooks
//
//  Created by ignacio.mendez on 01/09/2021.
//

import Foundation

class SuggestViewModel {
    
    var image = "ImageURLzzz"
    var title: String
    var author: String
    var year: String
    var status = "Available"
    var genre: String
    
    //    let api = Post()
    
    init(title: String, author: String, year: String, genre: String) {
        self.title = title
        self.author = author
        self.year = year
        self.title = title
        self.genre = genre
    }
    
    func postBook() {
        let dictionary = [
            "image": "\(image)",
            "title": "\(title)",
            "author": "\(author)",
            "year": "\(year)",
            "status": "\(status)",
            "genre": "\(genre)",
        ]
        let api = Post(params: dictionary)
        api.post()
        
    }
    
    
    
}


