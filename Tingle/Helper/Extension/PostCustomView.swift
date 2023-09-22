//
//  PostCustomView.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import Foundation
import SwiftUI

struct PostCustomView: View {
    let postListModel: PostsDataModel
    let viewModel: PostsListViewModel
    @State private var selectedImage: StringWrapper? = nil
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                RoundedBackgroundWithImage(backgroundColor: .white, imageName: postListModel.userImage, width: 50, hegiht: 50).onTapGesture {
                    viewModel.selectedImage = StringWrapper(name: postListModel.userImage)
                }
                VStack(alignment: .leading) {
                    Text(postListModel.userName)
                        .font(.headline)
                        .padding(.top, 8)
                    
                    Text(postListModel.postDate)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Menu(content: {
                    Button("Action 1", action: {})
                    Button("Action 2", action: {})
                    Button("Action 3", action: {})
                }) {
                    Image(postListModel.moreImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                }
            }
            Text(postListModel.postBody)
                .font(Font.system(size: 15))
            LazyVGrid(columns: [.init(.adaptive(minimum: 150, maximum: .infinity), spacing: 3)]) {
                ForEach(postListModel.postImages, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(10)
                        .onTapGesture {
                            viewModel.selectedImage = StringWrapper(name: image)
                        }
                }
            }
        }
    }
}
