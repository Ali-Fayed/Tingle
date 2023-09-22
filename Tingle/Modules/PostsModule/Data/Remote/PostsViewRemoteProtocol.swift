//
//  PostsViewRemoteProtocol.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//

import Foundation
import Combine
import CoreData

protocol PostsViewRemoteProtocol {
    func fetchPosts() -> AnyPublisher<PostsModel, APIError>
    func searchPostsSearch(seachKeyWord: String) -> AnyPublisher<PostsModel, APIError>
}
