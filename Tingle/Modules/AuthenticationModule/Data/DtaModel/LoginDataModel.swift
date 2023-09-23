//
//  LoginDataModel.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Foundation
struct LoginDataModel: Identifiable {
    let id = UUID()
    let username, email, firstName, lastName: String
    let gender: String
    let image: String
    let token: String
}
