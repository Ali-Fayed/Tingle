//
//  AuthViewMocks.swift
//  TingleTests
//
//  Created by Ali Fayed on 22/09/2023.
//

import XCTest
import Combine
@testable import Tingle
class AuthViewMocks: AuthRepositoryProtocol {
    func authenticateUser(userName: String, password: String) -> AnyPublisher<AuthDataModel, APIError> {
        return AuthViewStubGenerator().stubAuth()
            .map { result in
                return AuthDataModel(id: result.id, username: result.username, email: result.email, firstName: result.firstName, lastName: result.lastName, gender: result.gender, image: result.image, token: result.token)
            }.eraseToAnyPublisher()
    }
    
    typealias returnType = AnyPublisher<AuthDataModel, APIError>
    var fetchDone = false
}
