//
//  PostsListRepository.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//
import Combine
import CoreData

class PostsListRepository: PostsListRepoProtocol {
    private var networkManger = NetworkingManger.shared
    private let remote: PostsViewRemoteProtocol
    // MARK: - Initializer
    init(remote: PostsViewRemoteProtocol) {
        self.remote = remote
    }
    func fetchPosts() -> AnyPublisher<PostsEntity, APIError> {
        return remote.fetchPosts().map { result in
            return result
        }.eraseToAnyPublisher()
    }
    func searchPostsSearch(seachKeyWord: String) -> AnyPublisher<PostsEntity, APIError> {
        return remote.searchPostsSearch(seachKeyWord: seachKeyWord).map { result in
            return result
        }.eraseToAnyPublisher()
    }
}
