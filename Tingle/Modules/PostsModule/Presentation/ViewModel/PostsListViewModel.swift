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
    private var postsUseCase: PostsViewUseCaseInterface
    private var searchPostsUseCase: PostsViewSearchUseCaseInterface
    private var subscriptionsBag = Set< AnyCancellable > ()
    @Published var posts: [PostsDataModel] = []
    var coordinator: PostsListCoordinator
    // MARK: - States
    @Published var searchText = ""
    @Published var alertMessage = ""
    @Published var isSearching = false
    @Published var selectedImage: StringWrapper? = nil
    @Published var isLoading = false
    @Published var isDetailedPhotoViewAppeared = false
    // MARK: - Initalizer
    init(postsUseCase: PostsViewUseCaseInterface, searchPostsUseCase : PostsViewSearchUseCaseInterface ,coordinator: PostsListCoordinator) {
        self.postsUseCase = postsUseCase
        self.searchPostsUseCase = searchPostsUseCase
        self.coordinator = coordinator
    }
    // MARK: - Fetch Methods
    func fetchPosts() {
        self.isLoading = true
        postsUseCase.excute().sink { [weak self] completion in
            guard let self = self else {return}
            switch completion {
            case .failure(_):
                self.coordinator.presentAlert()
                self.alertMessage = LoginViewConstants.errorMessage
            case .finished:
                self.isLoading = false
            }
        } receiveValue: { [weak self] posts in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.posts.append(contentsOf: posts)
            }
        }.store(in: &subscriptionsBag)
    }
    
    func searchPostsSearch(seachKeyWord: String) {
        self.isLoading = true
        searchPostsUseCase.excute(query: seachKeyWord).sink { [weak self] completion in
            guard let self = self else {return}
            switch completion {
            case .failure(_):
                self.isLoading = false
                self.coordinator.presentAlert()
                self.alertMessage = LoginViewConstants.errorMessage
            case .finished:
                self.isLoading = false
            }
        } receiveValue: { [weak self] posts in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.posts = posts
            }
        }.store(in: &subscriptionsBag)
    }
}
