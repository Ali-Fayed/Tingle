//
//  PostsViewUseCaseProtocol.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Foundation
import Combine
/// - Description: UseCase Interface
protocol PostsViewUseCaseProtocol {
    /// Return Type ->  Store The Return Value in a Well Written Convention
    typealias returnType = AnyPublisher<PostsModel, APIError>
    /// Excute -> Excute The Use Case Responsibily
    func excute() -> returnType
}
