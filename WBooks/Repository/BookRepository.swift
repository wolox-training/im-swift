//
//  BookRepository.swift
//  WBooks
//
//  Created by ignacio.mendez on 09/08/2021.
//

import Foundation
import Alamofire

public class BookRepository {
    
    private static let baseURL: String = "https://ios-training-backend.herokuapp.com/api/v1"
    private static let booksURI: String = "/books"
    
    // fetch with alamofire request
    public func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        // build URL handle response
        let url = URL(string: BookRepository.baseURL+BookRepository.booksURI)!
        //make a request, handle response
        AF.request(url).responseJSON { response in
            //check if request was succesful
            switch response.result {
            //request was successful
            case .success(let value):
                //check if data is valid, if not call error function
                guard let JSONbooks = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                    onError (BookError.decodeError)
                    return
                }
                //check if data is valid, if not call error function
                guard let books = try? JSONDecoder().decode([Book].self, from: JSONbooks) else {
                    onError(BookError.decodeError)
                    return
                }
                onSuccess(books)
            case .failure(let error):
                onError(error)
            }
        }
        
    }
}

enum BookError: Error {
    case decodeError
}
