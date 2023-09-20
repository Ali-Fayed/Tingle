//
//  BaseRouter.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

extension BaseRouter {
    var scheme: String {
        return "https"
    }
    var baseURL: String {
        return "dummyjson.com"
    }
    var headers: HttpHeaders? {
        return ["Content-Type": "application/json"]
    }
}
