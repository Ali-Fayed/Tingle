//
//  LoginViewLibrary.swift
//  Tingle
//
//  Created by Ali Fayed on 21/09/2023.
//

import SwiftUI

extension LoginView {
    func authView() -> some View {
        return VStack(spacing: 10) {
                renderTopImage()
                Spacer()
                renderWelcomeTitle()
                renderUserNameTextField()
                renderPasswordTextFields()
                renderSignInButton()
        }.padding()
    }
    func renderTopImage() -> some View {
        return Image(LoginViewConstants.topViewImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 2)
            .edgesIgnoringSafeArea(.top)
    }
    func renderWelcomeTitle() -> some View {
        return Text(LoginViewConstants.welcomeText)
            .foregroundColor(Color(hex: LoginViewConstants.viewColor))
            .font(Font.system(size: 25, weight: .bold))
            .padding()
    }
    func renderUserNameTextField() -> some View {
        return VStack(alignment: .leading) {
            Text(LoginViewConstants.userNameTitle)
                .font(Font.system(size: 15, weight: .medium))
            TextField(LoginViewConstants.userNameTFplacholder, text: $viewModel.username)
                .frame(width: UIScreen.main.bounds.size.width - 60, height: 20)
                .padding()
                .background(Color(.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5)
                )
        }
    }
    func renderPasswordTextFields()  -> some View {
        return VStack(alignment: .leading) {
            Text(LoginViewConstants.passwordTitle)
                .font(Font.system(size: 15, weight: .medium))
            HStack {
                if viewModel.isPasswordVisible {
                    TextField(LoginViewConstants.passwordTFplacholder, text: $viewModel.password)
                } else {
                    SecureField(LoginViewConstants.passwordTFplacholder, text: $viewModel.password)
                }
                Button(action: {
                    viewModel.isPasswordVisible.toggle()
                }) {
                    Image(systemName: viewModel.isPasswordVisible ? LoginViewConstants.eyeSlashImage : LoginViewConstants.eyeImage)
                        .padding(.trailing, 10)
                        .foregroundColor(.gray)
                }
            }.frame(width: UIScreen.main.bounds.size.width - 60, height: 20).padding()
                .background(Color(.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5)
                )
        }
    }
    func renderSignInButton () -> some View {
        return Button(action: {
            viewModel.authenticateUser(userName: LoginViewConstants.userNameStatic, password: LoginViewConstants.passwordStatic, context: context, cachedModel: Array(authCachedModel))
        }) {
            Text(LoginViewConstants.signInText)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(hex: LoginViewConstants.viewColor))
                .cornerRadius(30)
        }.frame(width: UIScreen.main.bounds.size.width - 40, height: 20).padding(.top, 20)
    }
    func loadingIndicator() -> some View {
        return Group {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .foregroundColor(.white)
            }
        }
    }
}
