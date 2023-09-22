//
//  PostsListCoordinator.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Foundation
class PostsListCoordinator: ObservableObject {
    @Published var isMenuVisible = false
    @Published var isPresentingAlert = false
    
    func presentMoreMenu() {
        isMenuVisible = true
    }
    func presentAlert() {
        isPresentingAlert = true
    }
}
