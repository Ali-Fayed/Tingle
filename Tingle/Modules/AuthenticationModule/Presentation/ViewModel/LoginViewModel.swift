//
//  AuthenticationViewModel .swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import Foundation
import Combine
import CoreData

class LoginViewModel: ObservableObject {
    // MARK: - Propeties
    var coordinator: LoginViewCoordinator
    private var subscriptionsBag = Set< AnyCancellable>()
    private let loginUseCase: LoginUseCaseInterface
    private let cacheUserUseCase: CachedUserUseCaseInterface
    // MARK: - States
    @Published var isPasswordVisible = false
    @Published var isLoading = false
    @Published var alertMessage = ""
    @Published var username = ""
    @Published var password = ""
    // MARK: - Initalizer
    init(loginUseCase: LoginUseCaseInterface, cacheUserUseCase: CachedUserUseCaseInterface, coordinator: LoginViewCoordinator) {
        self.coordinator = coordinator
        self.loginUseCase = loginUseCase
        self.cacheUserUseCase = cacheUserUseCase
    }
    // MARK: - Methods
    func authenticateUser(userName: String, password: String, context: NSManagedObjectContext, cachedModel: [AuthSavedModel]) {
        self.isLoading = true
        loginUseCase.excute(userName: userName, password: password).sink { [weak self] completion in
            guard let self = self else {return}
            switch completion {
            case .finished:
                self.coordinator.presentPostsListView()
                self.isLoading = false
            case .failure(_):
                self.isLoading = false
                self.coordinator.presentAlertView()
                self.alertMessage = LoginViewConstants.errorMessage
            }
        } receiveValue: { authModel in
            DispatchQueue.main.async {
                self.cacheAuthenticatedUserData(authResponse: authModel, context: context, cachedModels: cachedModel)
            }
        }.store(in: &subscriptionsBag)
    }
    private func cacheAuthenticatedUserData(authResponse: LoginDataModel, context: NSManagedObjectContext, cachedModels: [AuthSavedModel]) {
        cacheUserUseCase.excute(authResponse: authResponse, context: context, cachedModels: cachedModels)
    }
}
