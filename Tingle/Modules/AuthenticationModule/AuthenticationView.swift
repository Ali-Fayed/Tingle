//
//  AuthenticationView.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//
import SwiftUI
import CoreData

struct AuthenticationView: View {
    // MARK: - Propeties
    @StateObject var viewModel = AuthenticationViewModel()
    // MARK: - CoreData
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
            entity: AuthSavedModel.entity(),
            sortDescriptors: [],
            predicate: nil
        ) var authCachedModel: FetchedResults<AuthSavedModel>
    // MARK: - View Body
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                renderTopImage()
                Spacer()
                VStack(spacing: 10) {
                    renderWelcomeTitle()
                    renderUserNameTextField()
                    renderPasswordTextFields()
                    renderSignInButton()
                }
            }.alert(isPresented: $viewModel.isAlertShown) {
                Alert(title: Text(AuthViewConstants.alertTitle), message: Text(viewModel.alertMessage), dismissButton: .default(Text(AuthViewConstants.oKTitle)))
            }.padding()
            //
            NavigationLink("", destination: PostsListView(), isActive: $viewModel.isAuthenticated).hidden()
            //
            }.disabled(viewModel.isLoading)
            .blur(radius: viewModel.isLoading ? 10.0 : 0.0)
            .overlay(
                Group {
                    if viewModel.isLoading{
                        ProgressView("Loading...").tint(.white).foregroundColor(.white)
                    }
                }
            )
        }
    }
    // MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
