//
//  SearchBarView.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    var body: some View {
        VStack(alignment: .leading) {
        HStack {
            if isSearching {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.primary)
                    .padding(.leading, 10)
                TextField("Search", text: $searchText)
                    .transition(.slide)
                    .animation(.easeInOut)
            } else {
                Spacer()
            }
            VStack(alignment: .leading) {
                Button(action: {
                    withAnimation {
                        isSearching.toggle()
                        if !isSearching {
                            searchText = ""
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                    }
                }) {
                    Image(systemName: isSearching ? "xmark.circle.fill" : "magnifyingglass")
                        .foregroundColor(.primary)
                }.padding(.trailing)
            }
        }}
        .frame(height: 40)
        .background(Color.white.opacity(0.15))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5)
        )
    }
}
