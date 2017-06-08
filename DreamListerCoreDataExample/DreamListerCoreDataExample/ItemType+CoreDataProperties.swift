//
//  ItemType+CoreDataProperties.swift
//  DreamListerCoreDataExample
//
//  Created by Berkant Y. GEDIZ on 6/5/17,23.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
