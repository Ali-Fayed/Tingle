//
//  LoginViewCoordinator.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import SwiftUI

class LoginViewCoordinator: ObservableObject {
    @Published var isPresentingPostsList = false
    @Published var isPresentingAlert = false
    
    func presentPostsListView() {
        isPresentingPostsList = true
    }
    func postsListView() -> some View {
        let remote = PostsViewRemote()
        let repo = PostsListRepository(remote: remote)
        let searchUseCase = PostsViewSearchUseCase(repository: repo)
        let useCase = PostsViewUseCase(repository: repo)
        let coordinator = PostsListCoordinator()
        let viewModel = PostsListViewModel(postsUseCase: useCase, searchPostsUseCase: searchUseCase, coordinator: coordinator)
        return PostsListView(viewModel: viewModel)
    }
    func presentAlertView() {
        isPresentingAlert = true
    }
}
