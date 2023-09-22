//
//  PostViewMocks.swift
//  TingleTests
//
//  Created by Ali Fayed on 22/09/2023.
//

import XCTest
import Combine
@testable import Tingle
class PostViewMocks: PostsListRepoProtocol {
    func fetchPosts() -> AnyPublisher<PostsEntity, APIError> {
        return PostsViewStubGenerator().stubPosts().map { result in
            return result
        }.eraseToAnyPublisher()
    }
    
    func searchPostsSearch(seachKeyWord: String) -> AnyPublisher<PostsEntity,APIError> {
        return PostsViewStubGenerator().stubPosts().map { result in
            return result
        }.eraseToAnyPublisher()
    }
}
