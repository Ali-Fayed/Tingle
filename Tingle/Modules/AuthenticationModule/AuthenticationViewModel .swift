//
//  AuthenticationViewModel .swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import Foundation
import Combine

class AuthenticationViewModel: ObservableObject {
    private var subscriptions = Set< AnyCancellable > ()
    @Published var isAuthenticated: Bool = false
    @Published var authModel: AuthModel?
    func authenticateUser(userName: String, password: String) {
        let request = NetworkingManger.shared.performRequest(router: RequestRouter.authentication(userName: userName, password: password), model: AuthModel.self, shouldCache: false)
        request.sink { completion in
            switch completion {
            case .failure(let error):
                print("Error: \(error)")
            case .finished:
                self.isAuthenticated = true
            }
        } receiveValue: { authModel in
            DispatchQueue.main.async {
                self.authModel = authModel
                print(authModel.email)
            }
        }.store(in: &subscriptions)
    }
}
