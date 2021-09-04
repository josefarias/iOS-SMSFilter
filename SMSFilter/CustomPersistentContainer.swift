//
//  CustomPersistentContainer.swift
//  SMSFilter
//
//  Created by Jose Farias on 9/4/21.
//

import Foundation
import CoreData

class CustomPersistentContainer: NSPersistentContainer {
    override open class func defaultDirectoryURL() -> URL {
        var storeURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.filter.core.data")
        storeURL = storeURL?.appendingPathComponent("SMSFilter.sqlite")
        return storeURL!
    }
}
