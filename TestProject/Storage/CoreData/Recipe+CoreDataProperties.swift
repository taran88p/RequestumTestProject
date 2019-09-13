//
//  Recipe+CoreDataProperties.swift
//  
//
//  Created by Pavel on 8/8/19.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var href: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var title: String?
    @NSManaged public var time: NSDate?

}
