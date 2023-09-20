//
//  PostsListView.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import SwiftUI

struct PostsListView: View {
    @StateObject private var viewModel = PostsListViewModel()
    
    var body: some View {
        NavigationView {
            Text("")
            .onAppear {
                viewModel.fetchPosts()
                viewModel.searchPostsSearch(seachKeyWord: "food")
            }
            .navigationBarTitle("Posts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView()
    }
}
