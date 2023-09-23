//
//  PostsViewRemote.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Combine
class PostsViewRemote: PostsViewRemoteInterface {
    private var networkManger = NetworkingManger.shared
    func fetchPosts() -> AnyPublisher<PostsEntity, APIError> {
        let model = PostsEntity.self
        let router = RequestRouter.posts
        let request = NetworkingManger.shared.performRequest(router: router, model: model)
        return request
    }
    func searchPostsSearch(seachKeyWord: String) -> AnyPublisher<PostsEntity, APIError> {
        let model = PostsEntity.self
        let router = RequestRouter.searchPosts(query: seachKeyWord)
        let request = NetworkingManger.shared.performRequest(router: router, model: model)
        return request
    }
}
