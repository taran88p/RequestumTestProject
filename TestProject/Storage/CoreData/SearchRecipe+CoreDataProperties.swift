//
//  SearchRecipe+CoreDataProperties.swift
//  
//
//  Created by Pavel on 8/8/19.
//
//

import Foundation
import CoreData


extension SearchRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SearchRecipe> {
        return NSFetchRequest<SearchRecipe>(entityName: "SearchRecipe")
    }

    @NSManaged public var href: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var title: String?
    @NSManaged public var time: NSDate?

}
