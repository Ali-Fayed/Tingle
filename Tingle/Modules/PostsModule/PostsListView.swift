//
//  PostsListView.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import SwiftUI

struct PostsListView: View {
    @StateObject private var viewModel = PostsListViewModel()
    @State private var searchText = ""
    @State private var isSearching = false

    var body: some View {
            List(viewModel.posts) { post in
                PostCustomView(post: post, imageURL: "Profile")
                }.listStyle(.plain)
            .navigationBarBackButtonHidden(true)
            .toolbar {
        
                ToolbarItem(placement: .navigationBarTrailing) {
                    if isSearching {
                        SearchBarView(searchText: $searchText, isSearching: $isSearching)
                          
                    } else {
                        Button(action: {
                            withAnimation {
                                isSearching.toggle()
                            }
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.primary)
                                .padding()
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    if isSearching {
                        Spacer()
                    } else {
                       Image("LOGO")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 30)
                            .padding()
                    }
                }
            }
            .onAppear {
                viewModel.fetchPosts()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView()
    }
}
