//
//  PostsListFactory.swift
//  Tingle
//
//  Created by Ali Fayed on 23/09/2023.
//

import SwiftUI
class PostsListFactory {
    static func createPostsListFactory() -> some View {
        let remote = PostsViewRemote()
        let repo = PostsListRepository(remote: remote)
        let useCase = PostsViewUseCase(repository: repo)
        let searchUseCase = PostsViewSearchUseCase(repository: repo)
        let coordinator = PostsListCoordinator()
        let viewModel = PostsListViewModel(postsUseCase: useCase, searchPostsUseCase: searchUseCase, coordinator: coordinator)
        return PostsListView(viewModel: viewModel)
    }
}
