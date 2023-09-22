//
//  AuthViewRemoteInterface.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Combine
/// - Description: Interface For Remote Layer Contains The Must Implement Methods
protocol AuthViewRemoteInterface {
    /// Return Type ->  Store The Return Value in a Well Written Convention
    typealias returnType = AnyPublisher<AuthEntity, APIError>
    /// Excute -> Excute The Remote Responsibilties
    func authenticateUser(userName: String, password: String) -> returnType
}
