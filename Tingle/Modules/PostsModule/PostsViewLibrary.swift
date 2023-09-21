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
            PostCustomView(postListModel: Modell(userName: "Ali Fayed", closeMarkImage: "xmark.circle.fill", moreImage: "dots", userImage: "Profile", postDate: "2 Days Ago", postImages: ["list-image-one", "list-image-two", "list-image-three", "list-image-four"], postBody: post.body, isAlertVisible: viewModel.isDetailedPhotoViewAppeared), viewModel: viewModel)
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
                        Image("LOGO")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 30)
                            .padding()
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .alignmentGuide(.trailing) { _ in 0 }
                            .foregroundColor(.primary)
                            .padding()
                    }
                }
            }
        }.padding(.leading, 10).padding(.trailing, 10)
    }
}

