//
//  AuthViewMocks.swift
//  TingleTests
//
//  Created by Ali Fayed on 22/09/2023.
//

import XCTest
import Combine
import CoreData
@testable import Tingle
class AuthViewMocks: LoginRepoInterface {
    func cacheAuthenticatedUserData(authResponse: LoginDataModel, context: NSManagedObjectContext, cachedModels: [AuthSavedModel]) {
        // no need for it
    }
    
    func authenticateUser(userName: String, password: String) -> AnyPublisher<LoginDataModel, APIError> {
        return AuthViewStubGenerator().stubAuth()
            .map { result in
                return LoginDataModel(username: result.username, email: result.email, firstName: result.firstName, lastName: result.lastName, gender: result.gender, image: result.image, token: result.token)
            }.eraseToAnyPublisher()
    }
    
    typealias returnType = AnyPublisher<LoginDataModel, APIError>
    var fetchDone = false
}
