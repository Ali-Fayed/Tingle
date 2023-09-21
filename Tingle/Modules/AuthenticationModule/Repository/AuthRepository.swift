//
//  AuthRepository.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Combine
import CoreData

class AuthRepository: AuthRepositoryProtocol {
    private let context: NSManagedObjectContext
    private var networkManger = NetworkingManger.shared
    private let authUserCachedModel = AuthUserCachedModel()

    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func authenticateUser(userName: String, password: String) -> AnyPublisher<AuthModel, APIError> {
        let model = AuthModel.self
        let routert = RequestRouter.authentication(userName: userName, password: password)
        let request = networkManger.performRequest(router: routert, model: model, shouldCache: false)
        return request
    }

    func cacheAuthenticatedUserData(authResponse: AuthModel, context: NSManagedObjectContext, cachedModels: [AuthSavedModel]) {
        let duplicate = cachedModels.first { $0.userName == authResponse.username }
        if duplicate == nil {
            authUserCachedModel.mapToCoreDataModel(context: context, authResponse: authResponse)
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
