//
//  PostsListRepoProtocol.swift
//  Tingle
//
//  Created by Ali Fayed on 22/09/2023.
//
import Combine
import CoreData

protocol PostsListRepoInterface {
    func fetchPosts() -> AnyPublisher<[PostsDataModel], APIError>
    func searchPostsSearch(seachKeyWord: String) -> AnyPublisher<[PostsDataModel], APIError>
}
