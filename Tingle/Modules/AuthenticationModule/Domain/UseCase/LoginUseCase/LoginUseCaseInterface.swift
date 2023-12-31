//
//  LoginUseCaseInterface.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Combine
/// - Description: UseCase Interface
protocol LoginUseCaseInterface {
    /// Return Type ->  Store The Return Value in a Well Written Convention
    typealias returnType = AnyPublisher<LoginDataModel, APIError>
    /// Excute -> Excute The Use Case Responsibily
    func excute(userName: String, password: String) -> returnType
}
