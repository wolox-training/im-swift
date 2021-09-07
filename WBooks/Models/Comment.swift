//
//  Comment.swift
//  WBooks
//
//  Created by ignacio.mendez on 12/08/2021.
//

import Foundation

public struct Comment: Codable {
    let id: Int
    let userId: Int
    let bookId: Int
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case bookId = "book_id"
        case content
    }
}
