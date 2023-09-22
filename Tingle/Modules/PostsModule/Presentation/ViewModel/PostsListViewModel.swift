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
    private var postsUseCase: PostsViewUseCaseProtocol
    private var searchPostsUseCase: PostsViewSearchUseCaseProtocol
    var coordinator: PostsListCoordinator
    private var subscriptions = Set< AnyCancellable > ()
    @Published var posts: [Post] = []
    // MARK: - States
    @Published var searchText = ""
    @Published var alertMessage = ""
    @Published var isSearching = false
    @Published var selectedImage: StringWrapper? = nil
    @Published var isLoading = false
    @Published var isDetailedPhotoViewAppeared = false
    // MARK: - Initalizer
    init(postsUseCase: PostsViewUseCaseProtocol, searchPostsUseCase : PostsViewSearchUseCaseProtocol ,coordinator: PostsListCoordinator) {
        self.postsUseCase = postsUseCase
        self.searchPostsUseCase = searchPostsUseCase
        self.coordinator = coordinator
    }
    func fetchPosts() {
        self.isLoading = true
        postsUseCase.excute().sink { completion in
            switch completion {
            case .failure(_):
                self.coordinator.presentAlert()
                self.alertMessage = AuthViewConstants.errorMessage
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
        searchPostsUseCase.excute(query: seachKeyWord).sink { completion in
            switch completion {
            case .failure(_):
                self.coordinator.presentAlert()
                self.alertMessage = AuthViewConstants.errorMessage
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
