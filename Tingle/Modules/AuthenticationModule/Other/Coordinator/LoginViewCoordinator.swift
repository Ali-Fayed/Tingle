//
//  LoginViewCoordinator.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import SwiftUI

class LoginViewCoordinator: ObservableObject {
    @Published var isPresentingPostsList = false
    @Published var isPresentingAlert = false
    
    func presentPostsListView() {
        isPresentingPostsList = true
    }
    func postsListView() -> some View {
        TabBarView()
    }
    func presentAlertView() {
        isPresentingAlert = true
    }
}
