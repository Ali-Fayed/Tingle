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
    private var subscriptionsBag = Set< AnyCancellable>()
    private var networkManger = NetworkingManger.shared
    @Published var authModel: AuthModel?
    @Published var isAuthenticated = false
    @Published var isPasswordVisible = false
    @Published var isLoading = false
    @Published var isAlertShown = false
    @Published var alertMessage = ""
    @Published var username = ""
    @Published var password = ""
    // MARK: - Methods
    func authenticateUser(userName: String, password: String, context: NSManagedObjectContext, cachedModel: [AuthSavedModel]) {
        let model = AuthModel.self
        let routert = RequestRouter.authentication(userName: userName, password: password)
        let request = networkManger.performRequest(router: routert, model: model, shouldCache: false)
        self.isLoading = true
        request.sink { completion in
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
        let duplicate = cachedModels.first { $0.userName == authResponse.username }
        
        if duplicate == nil {
            let newItem = AuthSavedModel(context: context)
            newItem.token = authResponse.token
            newItem.firstName = authResponse.firstName
            newItem.email = authResponse.email
            newItem.lastName = authResponse.lastName
            newItem.image = authResponse.image
            newItem.gender = authResponse.gender
            newItem.userName = authResponse.username
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
