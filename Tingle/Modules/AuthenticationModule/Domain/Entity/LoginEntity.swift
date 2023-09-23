//
//  LoginEntity.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

struct LoginEntity: Codable {
    let id: Int
    let username, email, firstName, lastName: String
    let gender: String
    let image: String
    let token: String
}
