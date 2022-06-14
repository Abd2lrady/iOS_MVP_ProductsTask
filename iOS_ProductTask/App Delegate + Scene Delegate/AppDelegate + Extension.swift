//
//  AppDelegate + Extension.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation
extension AppDelegate {
    
    func saveCachedData() {
        guard CoreDataManager.shared.context.hasChanges else { return }
            
        CoreDataManager.shared.saveContext()
    }
}


