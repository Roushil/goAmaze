//
//  Authentication+CoreDataProperties.swift
//  goAmaze
//
//  Created by Roushil singla on 4/9/20.
//  Copyright © 2020 personal. All rights reserved.
//
//

import Foundation
import CoreData


extension Authentication {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Authentication> {
        return NSFetchRequest<Authentication>(entityName: "Authentication")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?

}
