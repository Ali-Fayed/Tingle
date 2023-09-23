//
//  RoundedView.swift
//  Tingle
//
//  Created by Ali Fayed on 21/09/2023.
//

import SwiftUI
struct RoundedBackgroundWithImage: View {
    let backgroundColor: Color
    let imageName: String
    let width: CGFloat
    let hegiht: CGFloat
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: hegiht)
            .foregroundColor(.white)
            .padding(0)
            .background(backgroundColor)
            .clipShape(Circle())
    }
}
