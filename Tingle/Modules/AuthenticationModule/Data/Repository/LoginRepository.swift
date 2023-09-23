//
//  AuthRepository.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Combine
import CoreData

class LoginRepository: LoginRepoInterface {
    private let remote: LoginViewRemote
    private let local: LoginViewLocalInterface
    init(remote: LoginViewRemote, local: LoginViewLocalInterface) {
        self.remote = remote
        self.local = local
    }
    func authenticateUser(userName: String, password: String) -> AnyPublisher<LoginDataModel, APIError> {
        return remote.authenticateUser(userName: userName, password: password)
            .map { result in
                return LoginDataModel(username: result.username, email: result.email, firstName: result.firstName, lastName: result.lastName, gender: result.gender, image: result.image, token: result.token)
            }.eraseToAnyPublisher()
    }
    func cacheAuthenticatedUserData(authResponse: LoginDataModel, context: NSManagedObjectContext, cachedModels: [AuthSavedModel]) {
        local.cacheAuthenticatedUserData(authResponse: authResponse, context: context, cachedModels: cachedModels)
    }
}
