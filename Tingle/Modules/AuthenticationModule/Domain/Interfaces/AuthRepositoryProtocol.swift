//
//  AuthRepositoryProtocol.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Combine
import CoreData

protocol AuthRepositoryProtocol {
    func authenticateUser(userName: String, password: String) -> AnyPublisher<AuthDataModel, APIError>
}
