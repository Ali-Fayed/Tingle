//
//  PostsListView.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import SwiftUI

struct PostsListView: View {
    @StateObject var viewModel: PostsListViewModel
    var body: some View {
        searchBarView()
        Divider()
        ZStack {
            List {
                postsView()
            }.listStyle(.plain).onAppear {
                viewModel.fetchPosts()
            } .alert(isPresented: $viewModel.coordinator.isPresentingAlert) {
                Alert(title: Text(LoginViewConstants.alertTitle), message: Text(viewModel.alertMessage), dismissButton: .default(Text(LoginViewConstants.oKTitle)))
            }.onChange(of: viewModel.searchText) { newValue in
                viewModel.searchPostsSearch(seachKeyWord: newValue)
            }.onChange(of: viewModel.selectedImage) { newValue in
                withAnimation {
                    viewModel.isDetailedPhotoViewAppeared = true
                }
            }.blur(radius: viewModel.isDetailedPhotoViewAppeared ? 5.0 : 0.0).onTapGesture {
                withAnimation {
                    viewModel.isDetailedPhotoViewAppeared = false
                }
            }.ignoresSafeArea()
            //
            if viewModel.isDetailedPhotoViewAppeared {
                if let imageName = viewModel.selectedImage?.name {
                    imageDetailsView(imageName: imageName)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let remote = PostsViewRemote()
        let repo = PostsListRepository(remote: remote)
        let useCase = PostsViewUseCase(repository: repo)
        let searchUseCase = PostsViewSearchUseCase(repository: repo)
        let coordinator = PostsListCoordinator()
        let viewModel = PostsListViewModel(postsUseCase: useCase, searchPostsUseCase: searchUseCase, coordinator: coordinator)
        PostsListView(viewModel: viewModel)
    }
}
