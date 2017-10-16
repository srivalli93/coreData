//
//  Student+CoreDataProperties.swift
//  W07_Srivalli_Kanchibotla
//
//  Created by KANCHIBOTLA SRIVALLI  on 10/18/16.
//  Copyright © 2016 KANCHIBOTLA SRIVALLI . All rights reserved.
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student");
    }

    @NSManaged public var name: String?
    @NSManaged public var studentID: Int32
    @NSManaged public var courses: NSSet?

}

// MARK: Generated accessors for courses
extension Student {

    @objc(addCoursesObject:)
    @NSManaged public func addToCourses(_ value: Course)

    @objc(removeCoursesObject:)
    @NSManaged public func removeFromCourses(_ value: Course)

    @objc(addCourses:)
    @NSManaged public func addToCourses(_ values: NSSet)

    @objc(removeCourses:)
    @NSManaged public func removeFromCourses(_ values: NSSet)

}
