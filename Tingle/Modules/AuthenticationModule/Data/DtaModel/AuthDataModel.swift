//
//  AuthDataModel.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Foundation
struct AuthDataModel: Identifiable {
    let id: Int
    let username, email, firstName, lastName: String
    let gender: String
    let image: String
    let token: String
}
