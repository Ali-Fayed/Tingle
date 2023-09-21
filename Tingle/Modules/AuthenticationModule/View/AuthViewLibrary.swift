//
//  AuthViewLibrary.swift
//  Tingle
//
//  Created by Ali Fayed on 21/09/2023.
//

import SwiftUI
extension AuthenticationView {
    func renderTopImage() -> some View {
        return Image(AuthViewConstants.topViewImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 2)
    }
    func renderWelcomeTitle() -> some View {
        return Text(AuthViewConstants.welcomeText)
            .foregroundColor(Color(hex: AuthViewConstants.viewColor))
            .font(Font.system(size: 25, weight: .bold))
            .padding()
    }
        func renderUserNameTextField() -> some View {
            return TextField(AuthViewConstants.userNameTFplacholder, text: $viewModel.username)
                .padding()
                .background(Color(.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5)
                )
        }
        func renderPasswordTextFields ()  -> some View {
            return HStack {
                if viewModel.isPasswordVisible {
                    TextField(AuthViewConstants.passwordTFplacholder, text: $viewModel.password)
                } else {
                    SecureField(AuthViewConstants.passwordTFplacholder, text: $viewModel.password)
                }
                Button(action: {
                    viewModel.isPasswordVisible.toggle()
                }) {
                    Image(systemName: viewModel.isPasswordVisible ? AuthViewConstants.eyeSlashImage : AuthViewConstants.eyeImage)
                        .padding(.trailing, 10)
                        .foregroundColor(.gray)
                }
            }.padding()
                .background(Color(.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5)
                )
        }
        func renderSignInButton () -> some View {
            return Button(action: {
                viewModel.authenticateUser(userName: "kminchelle", password: "0lelplR", context: context, cachedModel: Array(authCachedModel))
            }) {
                Text(AuthViewConstants.signInText)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: AuthViewConstants.viewColor))
                    .cornerRadius(30)
            }.padding(.top, 20)
        }
}
