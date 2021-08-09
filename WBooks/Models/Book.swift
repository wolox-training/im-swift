//
//  Book.swift
//  WBooks
//
//  Created by ignacio.mendez on 06/08/2021.
//

import Foundation

public struct Book: Codable {
    let id: Int
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String
    
}

enum BookKey: String, CodingKey {
    case id = "id"
    case title = "title"
    case author = "author"
    case genre = "genre"
    case year = "year"
    case image = "image"
}

//public init(from: Decoder) {
//    let container = try! from.container(keyedBy: BookKey.self)
//    id = try! container.decode(Int.self, forKey: .id)
//    title = try! container.decode(String.self, forKey: .title)
//    author = try! container.decode(String.self, forKey: .author)
//    genre = try! container.decode(String.self, forKey: .genre)
//    year = try! container.decode(String.self, forKey: .year)
//    image = try! container.decode(String.self, forKey: .image)
//}


