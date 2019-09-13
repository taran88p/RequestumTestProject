//
//  NetworkManager.swift
//  TestProject
//
//  Created by Pavel on 8/7/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation
import Alamofire

enum APIParameters {
    static let recipeParameters = "i=onions,garlic&q=omelet&p=3"
    static let searchRecipeParameters = "q="
    static let baseAPIURL = "http://www.recipepuppy.com/api/?"
}

class APIManager: NSObject {
    
    typealias SuccessData = (Data) -> Void
    typealias Failure     = (Error) -> Void
    typealias Success     = () -> Void
    
    class func requestGETURL(url: URL, success: @escaping SuccessData, failure: @escaping Failure) {
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default,
                   headers: nil).responseJSON { (responseObject) -> Void in
                    switch responseObject.result {
                    case .success:
                        if let data = responseObject.data {
                            success(data)
                        }
                    case .failure(let error):
                        print("Request failed with error: \(error.localizedDescription)")
                        failure(error)
                    }
        }
    }
}

extension APIManager {
    
    static func getListRecipes(parameters: String, entityName: String, isSuccess: @escaping Success) {
        let string = APIParameters.baseAPIURL + parameters
        if let url = URL(string: string) {
            APIManager.requestGETURL(url: url, success: { (json) in
                InstructionResponse.parse(array: json, entityName: entityName)
                isSuccess()
            }) { (error) in
                isSuccess()
            }
        }
    }
}

