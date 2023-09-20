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
    private var subscriptions = Set< AnyCancellable > ()
    @Published var isAuthenticated: Bool = false
    @Published var authModel: AuthModel?
    func authenticateUser(userName: String, password: String, context: NSManagedObjectContext, cachedModel: [AuthSavedModel]) {
        let request = NetworkingManger.shared.performRequest(router: RequestRouter.authentication(userName: userName, password: password), model: AuthModel.self, shouldCache: false)
        request.sink { completion in
            switch completion {
            case .failure(let error):
                print("Error: \(error)")
                self.isAuthenticated = true
            case .finished:
                self.isAuthenticated = true
            }
        } receiveValue: { authModel in
            DispatchQueue.main.async {
                self.authModel = authModel
                self.cacheAuthenticatedUserData(authResponse: authModel, context: context, cachedModels: cachedModel)
                print(authModel.email)
            }
        }.store(in: &subscriptions)
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
        } else {
            print("Duplicate item found")
        }
    }
}
