//
//  PostsListViewModel.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import Foundation
import Combine
class PostsListViewModel: ObservableObject {
    // MARK: - Propeties
    private var repository: PostsListRepository
    var coordinator: PostsListCoordinator
    private var subscriptions = Set< AnyCancellable > ()
    @Published var posts: [Post] = []
    // MARK: - States
    @Published var searchText = ""
    @Published var isSearching = false
    @Published var selectedImage: StringWrapper? = nil
    @Published var isLoading = false
    @Published var isDetailedPhotoViewAppeared = false
    // MARK: - Initalizer
    init(repository: PostsListRepository, coordinator: PostsListCoordinator) {
        self.repository = repository
        self.coordinator = coordinator
    }
    func fetchPosts() {
        self.isLoading = true
        repository.fetchPosts().sink { completion in
            switch completion {
            case .failure(_):
                self.coordinator.presentAlert()
            case .finished:
                self.isLoading = false
            }
        } receiveValue: { posts in
            DispatchQueue.main.async {
                self.posts = posts.posts
            }
        }.store(in: &subscriptions)
    }
    
    func searchPostsSearch(seachKeyWord: String) {
        repository.searchPostsSearch(seachKeyWord: seachKeyWord).sink { completion in
            switch completion {
            case .failure(_):
                self.coordinator.presentAlert()
            case .finished:
                self.isLoading = true
            }
        } receiveValue: { posts in
            DispatchQueue.main.async {
                self.posts = posts.posts
            }
        }.store(in: &subscriptions)
    }
}
