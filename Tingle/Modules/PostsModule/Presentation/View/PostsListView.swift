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
                // Main Posts List
                postsView()
            }.listStyle(.plain).onAppear {
                // Fetch Posts
                viewModel.fetchPosts()
            } .alert(isPresented: $viewModel.coordinator.isPresentingAlert) {
                // API Error Alert
                Alert(title: Text(LoginViewConstants.alertTitle), message: Text(viewModel.alertMessage), dismissButton: .default(Text(LoginViewConstants.oKTitle)))
            }.onChange(of: viewModel.searchText) { newValue in
                // Search Action When Search Text Changes
                viewModel.searchPostsSearch(seachKeyWord: newValue)
            }.onChange(of: viewModel.selectedImage) { newValue in
                // Present Details View
                withAnimation {
                    viewModel.isDetailedPhotoViewAppeared = true
                }
                // Blurry Background When Zoom On Photo
            }.blur(radius: viewModel.isDetailedPhotoViewAppeared ? 5.0 : 0.0).onTapGesture {
                withAnimation {
                    viewModel.isDetailedPhotoViewAppeared = false
                }
            }.blur(radius: viewModel.isLoading ? 5.0 : 0.0).ignoresSafeArea()
            //
            if viewModel.isDetailedPhotoViewAppeared {
                if let imageName = viewModel.selectedImage?.name {
                    imageDetailsView(imageName: imageName)
                }
            }
        }
    }
}
// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListFactory.createPostsListFactory()
    }
}
