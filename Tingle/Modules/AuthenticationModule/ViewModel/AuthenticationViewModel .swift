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
    private var repository: AuthRepository
    private var subscriptionsBag = Set< AnyCancellable>()
    @Published var authModel: AuthModel?
    @Published var isAuthenticated = false
    @Published var isPasswordVisible = false
    @Published var isLoading = false
    @Published var isAlertShown = false
    @Published var alertMessage = ""
    @Published var username = ""
    @Published var password = ""
    init(repository: AuthRepository) {
          self.repository = repository
    }
    // MARK: - Methods
    func authenticateUser(userName: String, password: String, context: NSManagedObjectContext, cachedModel: [AuthSavedModel]) {
        self.isLoading = true
        repository.authenticateUser(userName: userName, password: password).sink { completion in
            switch completion {
            case .finished:
                self.isAuthenticated = true
                self.isLoading = false
            case .failure(_):
                self.isAuthenticated = true
//                self.isAlertShown = true
//                self.alertMessage = AuthViewConstants.errorMessage
                self.isLoading = false
            }
        } receiveValue: { authModel in
            DispatchQueue.main.async {
                self.authModel = authModel
                self.cacheAuthenticatedUserData(authResponse: authModel, context: context, cachedModels: cachedModel)
            }
        }.store(in: &subscriptionsBag)
    }
    private func cacheAuthenticatedUserData(authResponse: AuthModel, context: NSManagedObjectContext, cachedModels: [AuthSavedModel]) {
        repository.cacheAuthenticatedUserData(authResponse: authResponse, context: context, cachedModels: cachedModels)
    }
}
