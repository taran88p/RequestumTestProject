//
//  RecipeResponse.swift
//  TestProject
//
//  Created by Pavel on 8/7/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation

class InstructionResponse {
    
    class func parse(array: Data, entityName: String) {
        let parsedResult = try! JSONDecoder().decode(RecipeListResponse.self, from: array)
        for recipe in parsedResult.results {
            CoreDataManager.shared.saveEntity(recipe: recipe, entityName: entityName)
        }
    }
}
