//
//  AuthViewCoordinator.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import SwiftUI

class AuthViewCoordinator: ObservableObject {
    @Published var isPresentingPostsList = false
    @Published var isPresentingAlert = false
    
    func presentPostsListView() {
        isPresentingPostsList = true
    }
    func postsListView() -> some View {
        let repo = PostsListRepository()
        let coordinator = PostsListCoordinator()
        let viewModel = PostsListViewModel(repository: repo, coordinator: coordinator)
        return PostsListView(viewModel: viewModel)
    }
    func presentAlertView() {
        isPresentingAlert = true
    }
}
