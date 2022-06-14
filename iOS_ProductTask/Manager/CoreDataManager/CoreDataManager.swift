//
//  CoreDataManager.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import CoreData
import CoreText
import UIKit

class CoreDataManager {
    
    static var shared = CoreDataManager()
    
    private var _model: String?
    
    private init() {
        subscripSavingEvent()
    }
    
//    lazy var coordinator = configStoreCoordinator()
//    lazy var object = configManagedObject()
//    lazy var context = configContext()

    lazy var persistantContainer = configContainer()
    lazy var context = persistantContainer.viewContext

    var model: String? {
        get {
            _model
        } set {
            _model = newValue
        }
    }
    
    func subscripSavingEvent() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(saveContext),
                                       name: UIApplication.didEnterBackgroundNotification, object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(saveContext),
                                       name: UIApplication.willTerminateNotification, object: nil)
    }
}


extension CoreDataManager {
    
    func configContainer() -> NSPersistentContainer {
        let container = NSPersistentContainer(name: ModelNames.coreDataProduct)
        container.loadPersistentStores { containerDescription, error in
            if let error = error as? NSError {
                fatalError(error.localizedDescription)
            }
        }
        return container
    }
    
//    func configManagedObject() -> NSManagedObjectModel {
//        guard let modelUrl = Bundle.main.url(forResource: self.model, withExtension: "momd")
//        else {fatalError("can`t find Data Model")}
//
//        guard let managedObject = NSManagedObjectModel(contentsOf: modelUrl)
//        else {fatalError("can`t load Data Model")}
//
//        return managedObject
//    }
//
//    func configStoreCoordinator() -> NSPersistentStoreCoordinator {
//        let storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: object)
//
//        let storeFileName = "\(String(describing: self.model)).sqlite"
//        let storeUrl = FileManager.default.urls(for: .libraryDirectory,
//                                                in: .userDomainMask)[0].appendingPathComponent(storeFileName)
//
//        do {
//            try storeCoordinator.addPersistentStore(type: .sqlite, at: storeUrl)
//        } catch {
//            fatalError("\(error.localizedDescription)")
//        }
//
//        return storeCoordinator
//    }
//
//    func configContext() -> NSManagedObjectContext {
//        let managedContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//        managedContext.persistentStoreCoordinator = self.coordinator
//        return managedContext
//    }
    
    @objc
    func saveContext() {
        guard context.hasChanges
        else {
            print("no changes")
            return
        }
        do {
            try context.save()
        } catch {
            print("cache saving error\(error.localizedDescription)")
            }
    }
}
