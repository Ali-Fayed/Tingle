//
//  PostsListViewModel.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import Foundation
import Combine
class PostsListViewModel: ObservableObject {
    private var subscriptions = Set< AnyCancellable > ()
    @Published var posts: [Post] = []

    func fetchPosts() {
        let request = NetworkingManger.shared.performRequest(router: RequestRouter.posts, model: PostsModel.self, shouldCache: false)
        request.sink { completion in
            switch completion {
            case .failure(let error):
                print("Error: \(error)")
            case .finished:
                break
            }
        } receiveValue: { posts in
            DispatchQueue.main.async {
                self.posts = posts.posts
                print(posts.posts[0].body)
            }
        }.store(in: &subscriptions)
    }
    
    func searchPostsSearch(seachKeyWord: String) {
        let request = NetworkingManger.shared.performRequest(router: RequestRouter.searchPosts(query: seachKeyWord), model: PostsModel.self, shouldCache: false)
        request.sink { completion in
            switch completion {
            case .failure(let error):
                print("Error: \(error)")
            case .finished:
                break
            }
        } receiveValue: { posts in
            DispatchQueue.main.async {
                self.posts = posts.posts
                print(posts.posts[0].body)
            }
        }.store(in: &subscriptions)
    }
}
