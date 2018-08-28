//
//  PersistenceManager.swift
//  ContactsBookCD
//
//  Created by user on 25.08.2018.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation
import CoreData

final class PersistenceManager {
    
    private init() {}
    
    static let shared = PersistenceManager()
    
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ContactsBookCD")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data Saving support
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
                print("Successfully saved")
                NotificationCenter.default.post(name: NOTIF_SAVED_DATA_SUCCESS, object: nil)
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
        
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let fetchObjects = try context.fetch(fetchRequest) as? [T]
            return fetchObjects ?? [T]()
        } catch {
            print(error)
            return [T]()
        }
    }
    
    func delete(object: NSManagedObject) {
        context.delete(object)
        save()
    }
    
    
    
}
