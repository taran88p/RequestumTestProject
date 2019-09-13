//
//  SearchInstruction.swift
//  TestProject
//
//  Created by Pavel on 8/8/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation
import CoreData

enum InstructionKeys {
    static let title = "title"
    static let href  = "href"
    static let ingredients = "ingredients"
    static let thumbnail   = "thumbnail"
}

struct SearchInstruction {
    
    var title: String?
    var href: String?
    var ingredients: String?
    var thumbnail: String?
    
    init(recipe: NSManagedObject) {
        if let title = recipe.value(forKeyPath: InstructionKeys.title) as? String {
            self.title = title.replacingOccurrences(of: "\n", with: "")
        }
        
        if let href = recipe.value(forKeyPath: InstructionKeys.href) as? String {
            self.href = href
        }
        
        if let ingredients = recipe.value(forKeyPath: InstructionKeys.ingredients) as? String {
            self.ingredients = ingredients.firstUppercased
        }
        
        if let thumbnail = recipe.value(forKeyPath: InstructionKeys.thumbnail) as? String {
            self.thumbnail = thumbnail
        }
    }
}

