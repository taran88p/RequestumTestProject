//
//  SearchInstructionResponse.swift
//  TestProject
//
//  Created by Pavel on 8/8/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation
import CoreData

class SearchInstructionResponse {
    
    class func parse(array: [NSManagedObject]) -> [SearchInstruction] {
        var searchRecipesArray = [SearchInstruction]()
        for item in array {
            let recipe = SearchInstruction(recipe: item)
            searchRecipesArray.append(recipe)
        }
        return searchRecipesArray
    }
}

