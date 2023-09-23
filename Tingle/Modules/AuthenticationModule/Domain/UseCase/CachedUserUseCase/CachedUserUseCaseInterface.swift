//
//  CachedUserUseCaseInterface.swift
//  Tingle
//
//  Created by Ali Fayed on 23/09/2023.
//

import CoreData

protocol CachedUserUseCaseInterface {
    func excute(authResponse: LoginDataModel, context: NSManagedObjectContext, cachedModels: [AuthSavedModel]) 
}
