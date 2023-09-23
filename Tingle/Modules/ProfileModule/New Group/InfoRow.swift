//
//  InfoRow.swift
//  Tingle
//
//  Created by Ali Fayed on 23/09/2023.
//

import SwiftUI
struct InfoRow: View {
    var title: String
    var value: String

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.body)
        }
    }
}
