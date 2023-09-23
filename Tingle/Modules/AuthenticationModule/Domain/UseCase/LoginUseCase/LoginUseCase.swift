//
//  LoginUseCase.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Combine
class LoginUseCase: LoginUseCaseInterface {
    // MARK: - Properties
    typealias returnType = AnyPublisher<LoginDataModel, APIError>
    private let repo: LoginRepoInterface
    // MARK: - Intializer
    init(repo: LoginRepoInterface) {
        self.repo = repo
    }
    // MARK: - Use Case Excution Method
    /// - Description: Send Use Case Value to The Repository
    func excute(userName: String, password: String) -> returnType {
        return repo.authenticateUser(userName: userName, password: password)
    }
}
