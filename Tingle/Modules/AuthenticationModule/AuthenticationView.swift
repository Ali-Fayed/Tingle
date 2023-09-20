//
//  AuthenticationView.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//
import SwiftUI

struct AuthenticationView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("TopImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 200)
                    .padding(.top, 120)
                Spacer()
                
                
                VStack(spacing: 20) {
                    Text("Welcome")
                        .padding(.top, 20)
                        .foregroundColor(Color(hex: "#3F3FD1"))
                        .font(Font.system(size: 25, weight: .bold))
                        .padding(.bottom, -5)
                    
                    
                    TextField("Enter your user name", text: $username)
                        .padding()
                        .background(Color(.white))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                    
                    HStack {
                        if isPasswordVisible {
                            TextField("Enter your password", text: $password)
                        } else {
                            SecureField("Enter your password", text: $password)
                        }
                        
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                .padding(.trailing, 10)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.white))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                }
                
                Button(action: {
                    viewModel.authenticateUser(userName: username, password: password)
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "#3F3FD1"))
                        .cornerRadius(30)
                }
                .padding(.top, 20)
                NavigationLink("", destination: PostsListView(), isActive: $viewModel.isAuthenticated)
                    .hidden()
            }.edgesIgnoringSafeArea(.top)
            
                .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}

