//
//  AuthViewRemote.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Combine
class AuthViewRemote: AuthViewRemoteInterface {
    // MARK: - Properties
    typealias returnType = AnyPublisher<AuthEntity, APIError>
    // MARK: - Remote Services Methods
    /// Explain for this two methods : ->
    ///   - router: Request router contain the url, headers, path that combine together to build a request
    ///   - model: the return model beacause it's generic type
    ///   - response: Call the network layer singelton
    /// - Returns: Observable off the expected  decodable entity
    /// 
    func authenticateUser(userName: String, password: String) -> returnType {
        let model = AuthEntity.self
        let routert = RequestRouter.authentication(userName: userName, password: password)
        let response = NetworkingManger.shared.performRequest(router: routert, model: model, shouldCache: false)
        return response
    }
}
