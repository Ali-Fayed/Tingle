//
//  PostsViewSearchUseCaseProtocol.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Combine
/// - Description: UseCase Interface
protocol PostsViewSearchUseCaseProtocol {
    /// Return Type ->  Store The Return Value in a Well Written Convention
    typealias returnType = AnyPublisher<PostsEntity, APIError>
    /// Excute -> Excute The Use Case Responsibily
    func excute(query: String) -> returnType 
}
