//
//  PostsViewLibrary.swift
//  Tingle
//
//  Created by Ali Fayed on 21/09/2023.
//

import SwiftUI

extension PostsListView {
    func postsView() -> some View {
        return ForEach(viewModel.posts) { post in
            PostCustomView(postListModel: post, viewModel: viewModel).onAppear{
                if post.id == viewModel.posts.last?.id {
                    // infite scrolling
                    viewModel.fetchPosts()
                }
            }
        }
    }
    func imageDetailsView(imageName: String) -> some View {
        return VStack {
              Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .clipped()
                .aspectRatio(1, contentMode: .fit)
                .cornerRadius(10)
                .padding()
                .alignmentGuide(.top) { dimension in
                    dimension[.bottom]
                }
        }
    }
    func searchBarView () -> some View {
        return HStack {
            if viewModel.isSearching {
                SearchBarView(searchText: $viewModel.searchText, isSearching: $viewModel.isSearching)
            } else {
                Button(action: {
                    withAnimation {
                        viewModel.isSearching.toggle()
                    }
                }) {
                    HStack {
                        Image(PostsListConstants.logoTitle)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 30)
                            .padding()
                        Spacer()
                        Image(systemName: PostsListConstants.searchImage)
                            .alignmentGuide(.trailing) { _ in 0 }
                            .foregroundColor(.primary)
                            .padding()
                    }
                }
            }
        }.padding(.leading, 10).padding(.trailing, 10)
    }
    func loadingIndicator() -> some View {
        return Group {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .foregroundColor(.white)
            }
        }
    }
}
