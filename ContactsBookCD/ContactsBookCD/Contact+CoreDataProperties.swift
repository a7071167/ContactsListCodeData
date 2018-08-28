//
//  Contact+CoreDataProperties.swift
//  ContactsBookCD
//
//  Created by user on 25.08.2018.
//  Copyright © 2018 user. All rights reserved.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var company: String?
    @NSManaged public var phone: String
    @NSManaged public var name: String?

}
