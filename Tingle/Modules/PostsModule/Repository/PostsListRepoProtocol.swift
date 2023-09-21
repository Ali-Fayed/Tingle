//
//  PostsListRepoProtocol.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//
import Combine
import CoreData

protocol PostsListRepoProtocol {
    func fetchPosts() -> AnyPublisher<PostsModel, APIError>
    func searchPostsSearch(seachKeyWord: String) -> AnyPublisher<PostsModel, APIError>
}
