//
//  PostsEntity.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//
import SwiftUI

struct PostsEntity: Codable {
    let posts: [Post]
    let total, skip, limit: Int
}

struct Post: Codable, Identifiable {
    let id: Int
    let title, body: String
    let userID: Int
    let tags: [String]
    let reactions: Int

    enum CodingKeys: String, CodingKey {
        case id, title, body
        case userID = "userId"
        case tags, reactions
    }
}

