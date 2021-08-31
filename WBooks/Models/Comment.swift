//
//  Comment.swift
//  WBooks
//
//  Created by ignacio.mendez on 12/08/2021.
//

import Foundation

public struct Comment: Codable {
    let id: Int
    let user_id: Int
    let book_id: Int
    let content: String
}
