//
//  AuthRepository.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Combine
import CoreData

class AuthRepository: AuthRepositoryProtocol {
    private let context: NSManagedObjectContext
    private var networkManger = NetworkingManger.shared
    private let authUserCachedModel = AuthUserCachedModel()
    private let remote: AuthViewRemote
    init(remote: AuthViewRemote, context: NSManagedObjectContext) {
        self.remote = remote
        self.context = context
    }
    func authenticateUser(userName: String, password: String) -> AnyPublisher<AuthDataModel, APIError> {
        return remote.authenticateUser(userName: userName, password: password)
            .map { result in
                return AuthDataModel(id: result.id, username: result.username, email: result.email, firstName: result.firstName, lastName: result.lastName, gender: result.gender, image: result.image, token: result.token)
            }.eraseToAnyPublisher()
    }
}
