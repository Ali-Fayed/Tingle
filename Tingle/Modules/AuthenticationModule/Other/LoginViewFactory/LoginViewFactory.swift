//
//  LoginViewFactory.swift
//  Tingle
//
//  Created by Ali Fayed on 23/09/2023.
//

import SwiftUI
class LoginViewFactory {
    static func createLoginView() -> some View {
        let coordinator = LoginViewCoordinator()
        let remoteLayer = LoginViewRemote()
        let localLayer = LoginViewLocal()
        let repoistory = LoginRepository(remote: remoteLayer, local: localLayer)
        let loginUseCase = LoginUseCase(repo: repoistory)
        let saveUseUseCase = CachedUserUseCase(repo: repoistory)
        let viewModel = LoginViewModel(loginUseCase: loginUseCase, cacheUserUseCase: saveUseUseCase, coordinator: coordinator)
        return LoginView(viewModel: viewModel)
    }
}
