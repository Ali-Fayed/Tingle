//
//  PostViewMocks.swift
//  TingleTests
//
//  Created by Ali Fayed on 22/09/2023.
//

import XCTest
import Combine
@testable import Tingle
class PostViewMocks: PostsListRepoInterface {
    func fetchPosts() -> AnyPublisher<[PostsDataModel], APIError> {
        return PostsViewStubGenerator().stubPosts().map { result in
            let postsDataModels = result.posts.map { post in
                return PostsDataModel(
                    userName: PostsListConstants.userImage,
                    closeMarkImage: PostsListConstants.closeMarkImage,
                    moreImage: PostsListConstants.moreImage,
                    userImage: PostsListConstants.userImage,
                    postDate: PostsListConstants.postDate,
                    postImages: PostsListConstants.postImages,
                    postBody: post.body
                )
            }
            return postsDataModels
        }.eraseToAnyPublisher()
    }
    
    func searchPostsSearch(seachKeyWord: String) -> AnyPublisher<[PostsDataModel],APIError> {
        return PostsViewStubGenerator().stubPosts().map { result in
            let postsDataModels = result.posts.map { post in
                return PostsDataModel(
                    userName: PostsListConstants.userImage,
                    closeMarkImage: PostsListConstants.closeMarkImage,
                    moreImage: PostsListConstants.moreImage,
                    userImage: PostsListConstants.userImage,
                    postDate: PostsListConstants.postDate,
                    postImages: PostsListConstants.postImages,
                    postBody: post.body
                )
            }
            return postsDataModels
        }.eraseToAnyPublisher()
    }
}
