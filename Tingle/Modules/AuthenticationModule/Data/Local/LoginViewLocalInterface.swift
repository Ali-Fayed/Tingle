//
//  LoginViewLocalInterface.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import CoreData

protocol LoginViewLocalInterface {
    func cacheAuthenticatedUserData(authResponse: LoginDataModel, context: NSManagedObjectContext, cachedModels: [AuthSavedModel])
}
