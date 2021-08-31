//
//  CommentRepository.swift
//  WBooks
//
//  Created by ignacio.mendez on 12/08/2021.
//

import Foundation
import Alamofire

public class CommentRepository {
    
    private static let baseURL: String = "https://ios-training-backend.herokuapp.com/api/v1/books/"
    private static let booksURI: String = "/comments"
    
    // fetch with alamofire request
    public func fetchComment(id: Int, onSuccess: @escaping ([Comment]) -> Void, onError: @escaping (Error) -> Void) {
        // build URL handle response
        let url = URL(string: CommentRepository.baseURL+String(id)+CommentRepository.booksURI)!
        //make a request, handle response
        AF.request(url).responseJSON { response in
            //check if request was succesful
            switch response.result {
            //request was successful
            case .success(let value):
                //check if data is valid, if not call error function
                guard let JSONcomment = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                    onError (CommentError.decodeError)
                    return
                }
                //check if data is valid, if not call error function
                guard let comment = try? JSONDecoder().decode([Comment].self, from: JSONcomment) else {
                    onError(CommentError.decodeError)
                    return
                }
                onSuccess(comment)
            case .failure(let error):
                onError(error)
            }
        }
        
    }
}

enum CommentError: Error {
    case decodeError
}
