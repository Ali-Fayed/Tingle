//
//  AuthenticationView.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import SwiftUI

struct AuthenticationView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    
    var body: some View {
        NavigationView {
            Text("")
            .onAppear {
                viewModel.authenticateUser(userName: "kminchelle", password: "0lelplR")
            }
            .navigationBarTitle("Login")
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
