//
//  PostsDataModel.swift
//  Tingle
//
//  Created by Ali Fayed on 21/09/2023.
//

import Foundation
struct PostsDataModel: Identifiable {
    let id = UUID()
    let userName: String
    let closeMarkImage: String
    let moreImage: String
    let userImage: String
    let postDate: String
    let postImages: [String]
    let postBody: String
    let isAlertVisible: Bool
    var selectedImage: StringWrapper? = nil
}
