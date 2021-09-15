//
//  WBooksTests.swift
//  WBooksTests
//
//  Created by Nacho Mendez on 29/07/2021.
//

import XCTest
@testable import WBooks


class WBooksTests: XCTestCase {
    
    var sut: BookDetailView!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BookDetailView()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testStatusLabelAvailable() {
        //given
        
        //when
        sut.config(title: "title", year: "2000", genre: "accion", author: "Tolkien", status: "Available", image: "image")
        
        //then
        XCTAssertEqual(sut.statusBook.textColor, UIColor.systemGreen, "Wrong color" )
        
    }
    
    func testStatusLabelNotAvailable() {
        //given
        
        //when
        sut.config(title: "title", year: "2000", genre: "accion", author: "Tolkien", status: "Not Available", image: "image")
        
        //then
        XCTAssertEqual(sut.statusBook.textColor, UIColor.systemRed, "Wrong color" )
        
    }
    
}
