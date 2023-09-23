//
//  PostsListRepository.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//
import Combine
import CoreData

class PostsListRepository: PostsListRepoInterface {
    private var networkManger = NetworkingManger.shared
    private let remote: PostsViewRemoteInterface
    // MARK: - Initializer
    init(remote: PostsViewRemoteInterface) {
        self.remote = remote
    }
    func fetchPosts() -> AnyPublisher<[PostsDataModel], APIError> {
        return remote.fetchPosts().map { result in
            let postsDataModels = result.posts.map { post in
                return PostsDataModel(
                    userName: PostsListConstants.staticPostUserName,
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

    func searchPostsSearch(seachKeyWord: String) -> AnyPublisher<[PostsDataModel], APIError> {
        return remote.searchPostsSearch(seachKeyWord: seachKeyWord).map { result in
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
