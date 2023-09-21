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
        return PostsListView()
    }
    func presentAlertView() {
        isPresentingAlert = true
    }
}
