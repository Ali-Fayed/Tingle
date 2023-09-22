//
//  AuthUseCase.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Combine
class AuthUseCase: AuthUseCaseInterface {
    // MARK: - Properties
    typealias returnType = AnyPublisher<AuthDataModel, APIError>
    private let repository: AuthRepositoryProtocol
    // MARK: - Intializer
    init(repository: AuthRepositoryProtocol) {
        self.repository = repository
    }
    // MARK: - Use Case Excution Method
    /// - Description: Send Use Case Value to The Repository
    func excute(userName: String, password: String) -> returnType {
        return repository.authenticateUser(userName: userName, password: password)
    }
}
