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
    let status: String
    
}
