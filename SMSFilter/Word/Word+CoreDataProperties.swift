//
//  Word+CoreDataProperties.swift
//  SMSFilter
//
//  Created by Jose Farias on 9/4/21.
//
//

import Foundation
import CoreData


extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}

extension Word : Identifiable {

}
