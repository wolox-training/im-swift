//
//  File.swift
//  WBooks
//
//  Created by ignacio.mendez on 11/09/2021.
//

//MARK: -Data

import UIKit

struct Video {
    var image: UIImage
    var title: String
    var author: String
}

func fetchData() -> [Video] {
    let video1 = Video(image: UIImage(named: "ic_library active")!, title: "foto de libros", author: "Tolkien1")
    let video2 = Video(image: UIImage(named: "ic_myrentals active")!, title: "foto de tilde", author: "Tolkien2")
    let video3 = Video(image: UIImage(named: "ic_library active")!, title: "foto de libros", author: "Tolkien3")
    let video4 = Video(image: UIImage(named: "ic_myrentals active")!, title: "foto de tilde", author: "Tolkien4")
    let video5 = Video(image: UIImage(named: "ic_library active")!, title: "foto de libros", author: "Tolkien5")
    let video6 = Video(image: UIImage(named: "ic_myrentals active")!, title: "foto de tilde", author: "Tolkien7")
    let video7 = Video(image: UIImage(named: "ic_library active")!, title: "foto de libros", author: "Tolkien7")
    let video8 = Video(image: UIImage(named: "ic_myrentals active")!, title: "foto de tilde", author: "Tolkien8")
    let video9 = Video(image: UIImage(named: "ic_library active")!, title: "foto de libros", author: "Tolkien9")
    let video10 = Video(image: UIImage(named: "ic_myrentals active")!, title: "foto de tilde", author: "Tolkien10")
    
    return [video1, video2,video3, video4, video5, video6, video7, video8, video9, video10]
}
