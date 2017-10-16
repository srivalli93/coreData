//
//  Course+CoreDataProperties.swift
//  W07_Srivalli_Kanchibotla
//
//  Created by KANCHIBOTLA SRIVALLI  on 10/18/16.
//  Copyright © 2016 KANCHIBOTLA SRIVALLI . All rights reserved.
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course");
    }

    @NSManaged public var courseNum: Int16
    @NSManaged public var deptAbbr: String?
    @NSManaged public var title: String?
    @NSManaged public var enrollees: NSSet?

}

// MARK: Generated accessors for enrollees
extension Course {

    @objc(addEnrolleesObject:)
    @NSManaged public func addToEnrollees(_ value: Student)

    @objc(removeEnrolleesObject:)
    @NSManaged public func removeFromEnrollees(_ value: Student)

    @objc(addEnrollees:)
    @NSManaged public func addToEnrollees(_ values: NSSet)

    @objc(removeEnrollees:)
    @NSManaged public func removeFromEnrollees(_ values: NSSet)

}
