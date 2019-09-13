//
//  CoreDataManager.swift
//  TestProject
//
//  Created by Pavel on 8/7/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    static let shared: CoreDataManager = {
        return CoreDataManager()
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TestProject")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveEntity(recipe: Instruction, entityName: String) {
        if let entity = NSEntityDescription.entity(forEntityName: entityName, in: persistentContainer.viewContext) {
            let person = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext)
            person.setValue(recipe.title, forKeyPath: InstructionKeys.title)
            person.setValue(recipe.href, forKeyPath: InstructionKeys.href)
            person.setValue(recipe.ingredients, forKeyPath: InstructionKeys.ingredients)
            person.setValue(recipe.thumbnail, forKeyPath: InstructionKeys.thumbnail)
        }
        do {
            try persistentContainer.viewContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchEntity(nameEntity: String) -> [NSManagedObject] {
        
        let request = NSFetchRequest<NSManagedObject>(entityName: nameEntity)
        do {
            let fetchedentities = try persistentContainer.viewContext.fetch(request)
            return fetchedentities
        } catch {
            fatalError("Failure to fetch entities: \(error)")
        }
    }
    
    func removeEntity(entity:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try persistentContainer.viewContext.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                persistentContainer.viewContext.delete(objectData)
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
    }
}
