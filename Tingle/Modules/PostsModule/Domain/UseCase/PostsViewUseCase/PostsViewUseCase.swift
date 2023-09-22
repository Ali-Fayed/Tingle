//
//  PostsViewUseCase.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Foundation
import Combine
class PostsViewUseCase: PostsViewUseCaseProtocol {
    // MARK: - Properties
    typealias returnType = AnyPublisher<PostsModel, APIError>
    private let repository: PostsListRepoProtocol
    // MARK: - Intializer
    init(repository: PostsListRepoProtocol) {
        self.repository = repository
    }
    // MARK: - Use Case Excution Method
    /// - Description: Send Use Case Value to The Repository
    func excute() -> returnType {
        return repository.fetchPosts()
    }
}
