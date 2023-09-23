//
//  LoginViewLocal.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import CoreData

class LoginViewLocal: LoginViewLocalInterface {
    typealias CoreDataModel = AuthSavedModel
    func mapToCoreDataModel(context: NSManagedObjectContext, authResponse: LoginDataModel) {
        let newItem = AuthSavedModel(context: context)
        newItem.token = authResponse.token
        newItem.firstName = authResponse.firstName
        newItem.email = authResponse.email
        newItem.lastName = authResponse.lastName
        newItem.image = authResponse.image
        newItem.gender = authResponse.gender
        newItem.userName = authResponse.username
    }
    
    func cacheAuthenticatedUserData(authResponse: LoginDataModel, context: NSManagedObjectContext, cachedModels: [AuthSavedModel]) {
        let duplicate = cachedModels.first { $0.userName == authResponse.username }
        if duplicate == nil {
            mapToCoreDataModel(context: context, authResponse: authResponse)
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
