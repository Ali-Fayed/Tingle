//
//  PostsViewSearchUseCase.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Foundation
import Combine
class PostsViewSearchUseCase: PostsViewSearchUseCaseInterface {
    // MARK: - Properties
    typealias returnType = AnyPublisher<[PostsDataModel], APIError>
    private let repository: PostsListRepoInterface
    // MARK: - Intializer
    init(repository: PostsListRepoInterface) {
        self.repository = repository
    }
    // MARK: - Use Case Excution Method
    /// - Description: Send Use Case Value to The Repository
    func excute(query: String) -> returnType {
        return repository.searchPostsSearch(seachKeyWord: query)
    }
}
