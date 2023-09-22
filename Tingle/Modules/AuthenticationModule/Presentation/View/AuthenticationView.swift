//
//  AuthenticationView.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//
import SwiftUI
import CoreData

struct AuthenticationView: View {
    // MARK: - Properties
    @StateObject var viewModel: AuthenticationViewModel
    // MARK: - CoreData
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        entity: AuthSavedModel.entity(),
        sortDescriptors: [],
        predicate: nil
    ) var authCachedModel: FetchedResults<AuthSavedModel>
    // MARK: - View Body
    var body: some View {
        authView()
        .alert(isPresented: $viewModel.coordinator.isPresentingAlert) {
            Alert(title: Text(AuthViewConstants.alertTitle), message: Text(viewModel.alertMessage), dismissButton: .default(Text(AuthViewConstants.oKTitle)))
        }.fullScreenCover(isPresented: $viewModel.coordinator.isPresentingPostsList) {
            viewModel.coordinator.postsListView()
        }.blur(radius: viewModel.isLoading ? 10.0 : 0.0)
        .overlay(
            loadingIndicator()
        )
    }
}

// MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator = AuthViewCoordinator()
        let remote = AuthViewRemote()
        let repo = AuthRepository(remote: remote, context: PersistenceController.shared.container.viewContext)
        let useCase = AuthUseCase(repository: repo)
        let viewModel = AuthenticationViewModel(useCase: useCase, coordinator: coordinator)
        AuthenticationView(viewModel: viewModel)
    }
}
