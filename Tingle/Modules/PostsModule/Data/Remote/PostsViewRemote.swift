//
//  PostsViewRemote.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Combine
class PostsViewRemote: PostsViewRemoteProtocol {
    private var networkManger = NetworkingManger.shared
    func fetchPosts() -> AnyPublisher<PostsModel, APIError> {
        let model = PostsModel.self
        let router = RequestRouter.posts
        let request = NetworkingManger.shared.performRequest(router: router, model: model)
        return request
    }
    func searchPostsSearch(seachKeyWord: String) -> AnyPublisher<PostsModel, APIError> {
        let model = PostsModel.self
        let router = RequestRouter.searchPosts(query: seachKeyWord)
        let request = NetworkingManger.shared.performRequest(router: router, model: model)
        return request
    }
}
