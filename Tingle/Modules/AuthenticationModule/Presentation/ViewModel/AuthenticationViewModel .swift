//
//  AuthenticationViewModel .swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import Foundation
import Combine
import CoreData

class AuthenticationViewModel: ObservableObject {
    // MARK: - Propeties
    var coordinator: AuthViewCoordinator
    private var subscriptionsBag = Set< AnyCancellable>()
    private let useCase: AuthUseCaseInterface
    // MARK: - States
    @Published var isPasswordVisible = false
    @Published var isLoading = false
    @Published var alertMessage = ""
    @Published var username = ""
    @Published var password = ""
    // MARK: - Initalizer
    init(useCase: AuthUseCaseInterface, coordinator: AuthViewCoordinator) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    // MARK: - Methods
    func authenticateUser(userName: String, password: String, context: NSManagedObjectContext, cachedModel: [AuthSavedModel]) {
        self.isLoading = true
        useCase.excute(userName: userName, password: password).sink { completion in
            switch completion {
            case .finished:
                self.coordinator.presentPostsListView()
                self.isLoading = false
            case .failure(_):
                self.isLoading = false
                self.coordinator.presentAlertView()
                self.alertMessage = AuthViewConstants.errorMessage
            }
        } receiveValue: { authModel in
            DispatchQueue.main.async {
                self.cacheAuthenticatedUserData(authResponse: authModel, context: context, cachedModels: cachedModel)
            }
        }.store(in: &subscriptionsBag)
    }
    private func cacheAuthenticatedUserData(authResponse: AuthDataModel, context: NSManagedObjectContext, cachedModels: [AuthSavedModel]) {
        AuthUserCachedModel().cacheAuthenticatedUserData(authResponse: authResponse, context: context, cachedModels: cachedModels)
    }
}
