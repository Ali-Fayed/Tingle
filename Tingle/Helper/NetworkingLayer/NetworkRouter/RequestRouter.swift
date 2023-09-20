//
//  RequestRouter.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import Foundation
enum RequestRouter: BaseRouter {
    case authentication(userName: String, password: String)
    case posts
    case searchPosts(query: String)
    //MARK: - Path
    var path: String {
        switch self {
        case .authentication:
            return "/auth/login"
        case .posts:
            return "/posts"
        case .searchPosts:
            return "/posts/search"
        }
    }
    //MARK: - HTTPMethod
    var method: HttpMethod {
        switch self {
        case .authentication:
            return .post
        case .posts, .searchPosts:
            return .get
        }
    }
    //MARK: - Parameters or Body
    var parameter: HttpParameters? {
        switch self {
        case .authentication(userName: let userName, password: let password):
            return ["username": userName, "password": password]
        case .posts:
            return nil
        case .searchPosts(query: let query):
            return ["q": query]
        }
    }
}
