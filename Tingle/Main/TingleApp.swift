//
//  TingleApp.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import SwiftUI

@main
struct TingleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            configureView()
        }
    }
    
}
extension TingleApp {
    func configureView() -> some View {
        let coordinator = AuthViewCoordinator()
        let remote = AuthViewRemote()
        let repo = AuthRepository(remote: remote, context: PersistenceController.shared.container.viewContext)
        let useCase = AuthUseCase(repository: repo)
        let viewModel = AuthenticationViewModel(useCase: useCase, coordinator: coordinator)
        return AuthenticationView(viewModel: viewModel).environment(\.managedObjectContext, persistenceController.container.viewContext)
  }
}
