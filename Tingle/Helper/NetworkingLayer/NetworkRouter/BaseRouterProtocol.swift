//
//  BaseRouterProtocol.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

typealias HttpHeaders = [String: String]
typealias HttpParameters = [String: String]
protocol BaseRouter {
    var baseURL: String {get}
    var scheme: String {get}
    var path: String {get}
    var method: HttpMethod { get }
    var headers: HttpHeaders? { get }
    var parameter: HttpParameters? { get}
}
