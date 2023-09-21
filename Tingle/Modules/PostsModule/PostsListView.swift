//
//  PostsListView.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import SwiftUI

struct PostsListView: View {
    @StateObject var viewModel = PostsListViewModel()
    var body: some View {
        searchBarView()
        Divider()
        ZStack {
            List {
                postsView()
            }.listStyle(.plain).onAppear {
                viewModel.fetchPosts()                
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
        PostsListView()
    }
}
