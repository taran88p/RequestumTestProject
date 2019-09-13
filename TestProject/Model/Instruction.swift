//
//  Recipe.swift
//  TestProject
//
//  Created by Pavel on 8/7/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation

struct Instruction: Decodable {
    
    var title: String
    var href: String
    var ingredients: String
    var thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case href
        case ingredients
        case thumbnail
    }
}

struct  RecipeListResponse: Decodable {
    
    var results: [Instruction]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
