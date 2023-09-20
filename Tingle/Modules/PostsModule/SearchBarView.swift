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
        HStack {
            if isSearching {
                TextField("Search", text: $searchText)
                    .padding(.leading, 210)
                    .transition(.slide)
                    .animation(.easeInOut)
            
            } else {
                Spacer()
            }
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
        .frame(height: 40)
        .background(Color.gray.opacity(0.15))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}


struct StringWrapper: Identifiable {
    var id = UUID() // Generate a unique identifier
    var name: String?
}
