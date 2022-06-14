//
//  CachedProduct+CoreDataProperties.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady on 14/06/2022.
//
//

import Foundation
import CoreData


extension CachedProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedProduct> {
        return NSFetchRequest<CachedProduct>(entityName: "CachedProduct")
    }

    @NSManaged public var productDescription: String?
    @NSManaged public var productID: Int16
    @NSManaged public var productPrice: Int16
    @NSManaged public var imgUrl: String?
    @NSManaged public var imgWidth: Int16
    @NSManaged public var imgHeight: Int16

}

extension CachedProduct : Identifiable {

}
