//
//  Post.swift
//  WBooks
//
//  Created by ignacio.mendez on 02/09/2021.
//

import Foundation
import Alamofire

public class PostSuggest {
    
    var params: [String: String]
    
    init(params: [String: String]) {
        self.params = params
    }
    
    private static let baseURL: String = "https://ios-training-backend.herokuapp.com/api/v1"
    private static let booksURI: String = "/books"
    
    public func post() {
        let url = URL(string: PostSuggest.baseURL+PostSuggest.booksURI)!
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
    }
}
