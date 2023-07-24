//
//  Cat+CoreDataProperties.swift
//  KindHeartCatRescue
//
//  Created by m_959058 on 8/25/22.
//
//

import Foundation
import CoreData


extension Cat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cat> {
        return NSFetchRequest<Cat>(entityName: "Cat")
    }

    @NSManaged public var name: String?
    @NSManaged public var url: String?
    @NSManaged public var breed: String?
    @NSManaged public var desc: String?
    @NSManaged public var id: Int16
    @NSManaged public var fixed: String?
    @NSManaged public var gender: String?
    @NSManaged public var age: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var imageData: Data?

}

extension Cat : Identifiable {

}
