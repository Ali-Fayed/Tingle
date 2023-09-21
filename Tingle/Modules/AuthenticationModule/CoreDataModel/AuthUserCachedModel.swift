//
//  AuthUserCachedModel.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import CoreData

class AuthUserCachedModel: CoreDataCacheable {
    typealias CoreDataModel = AuthSavedModel
    func mapToCoreDataModel(context: NSManagedObjectContext, authResponse: AuthModel) {
        let newItem = AuthSavedModel(context: context)
        newItem.token = authResponse.token
        newItem.firstName = authResponse.firstName
        newItem.email = authResponse.email
        newItem.lastName = authResponse.lastName
        newItem.image = authResponse.image
        newItem.gender = authResponse.gender
        newItem.userName = authResponse.username
    }
}
