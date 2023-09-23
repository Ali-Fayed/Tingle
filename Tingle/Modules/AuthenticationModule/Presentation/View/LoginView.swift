//
//  LoginView.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//
import SwiftUI
import CoreData

struct LoginView: View {
    // MARK: - Properties
    @StateObject var viewModel: LoginViewModel
    // MARK: - CoreData
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: AuthSavedModel.entity(), sortDescriptors: [], predicate: nil
    ) var authCachedModel: FetchedResults<AuthSavedModel>
    // MARK: - View Body
    var body: some View {
        // Main View
        authView()
        // Error Alert
        .alert(isPresented: $viewModel.coordinator.isPresentingAlert) {
            Alert(title: Text(LoginViewConstants.alertTitle), message: Text(viewModel.alertMessage), dismissButton: .default(Text(LoginViewConstants.oKTitle)))
       // Posts List View Navigation
        }.fullScreenCover(isPresented: $viewModel.coordinator.isPresentingPostsList) {
            if authCachedModel.first?.token != nil {
                viewModel.coordinator.postsListView()
            }
        // Blurry Background When Loading
        }.blur(radius: viewModel.isLoading ? 10.0 : 0.0)
        .overlay(
            // Progress View When Loading
            loadingIndicator()
        )
    }
}
// MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewFactory.createLoginView()
    }
}
