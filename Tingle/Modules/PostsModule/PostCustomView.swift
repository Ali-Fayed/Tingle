//
//  PostCustomView.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import Foundation
import SwiftUI

struct PostCustomView: View {
    let post: Post
    let imageURL: String
    @State private var selectedImage: StringWrapper? = nil // Wrap String in an Identifiable struct
    
    var body: some View {
 
        VStack(alignment: .leading) {
            HStack {
                Image(imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text("Ali Fayed")
                        .font(.headline)
                        .padding(.top, 8)
                    
                    Text("2 days ago")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image("dots")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            
            Text(post.body)
                .font(Font.system(size: 15))
            LazyVGrid(columns: [.init(.adaptive(minimum: 150, maximum: .infinity), spacing: 3)]) {
                ForEach(0..<4) { ix in
                    Image("Rectangle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(10)
                        .onTapGesture {
                            // Show the selected image in a modal view
                            selectedImage = StringWrapper(name: "Rectangle")
                        }
                }
            }.sheet(item: $selectedImage) { wrappedImage in
                if let imageName = wrappedImage.name {
                    VStack {
                        // Close button
                        Button(action: {
                            selectedImage = nil
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                        // Blurry background
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipped()
                            .aspectRatio(1, contentMode: .fit)
                            .cornerRadius(10)
                        
                        
                            .padding()
                            .alignmentGuide(.top) { dimension in
                                dimension[.bottom]
                            }
                    }
                    .ignoresSafeArea()
                }
            }
        }
    }
}
