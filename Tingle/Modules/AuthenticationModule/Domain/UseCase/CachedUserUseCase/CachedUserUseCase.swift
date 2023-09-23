//
//  CachedUserUseCase.swift
//  Tingle
//
//  Created by Ali Fayed on 23/09/2023.
//

import CoreData
class CachedUserUseCase: CachedUserUseCaseInterface {
    // MARK: - Properties
    private let repo: LoginRepoInterface
    // MARK: - Intializer
    init(repo: LoginRepoInterface) {
        self.repo = repo
    }
    // MARK: - Use Case Excution Method
    /// - Description: Send Use Case Value to The Repository
    func excute(authResponse: LoginDataModel, context: NSManagedObjectContext, cachedModels: [AuthSavedModel])  {
        return repo.cacheAuthenticatedUserData(authResponse: authResponse, context: context, cachedModels: cachedModels)
    }
}
