//
//  LoginRepoInterface.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Combine
import CoreData

protocol LoginRepoInterface {
    func authenticateUser(userName: String, password: String) -> AnyPublisher<LoginDataModel, APIError>
    func cacheAuthenticatedUserData(authResponse: LoginDataModel, context: NSManagedObjectContext, cachedModels: [AuthSavedModel])
}
