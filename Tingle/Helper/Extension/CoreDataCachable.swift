//
//  CoreDataCachable.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Foundation
import CoreData

protocol CoreDataCacheable {
    associatedtype CoreDataModel: NSManagedObject
    associatedtype ResponseModel: Identifiable
    func mapToCoreDataModel(context: NSManagedObjectContext, authResponse: ResponseModel)
}
