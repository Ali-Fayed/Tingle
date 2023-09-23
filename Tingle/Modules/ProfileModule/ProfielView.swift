//
//  ProfileView.swift
//  Tingle
//
//  Created by Ali Fayed on 23/09/2023.
//

import SwiftUI
import CoreData

struct ProfileView: View {
    // MARK: - Properties
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(entity: AuthSavedModel.entity(), sortDescriptors: [], predicate: nil) var authCachedModel: FetchedResults<AuthSavedModel>
    @State private var showDefaultImage = false
    @State private var isShowingLogin = false
    // MARK: - View
    var body: some View {
        NavigationView {
            List {
                Section {
                    VStack {
                        Spacer()
                        AsyncImage(url: URL(string: authCachedModel.first?.image ?? "")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 140, height: 140)
                                    .clipShape(Circle())
                            case .failure:
                                Image(systemName: ProfileConstants.profileImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 140, height: 140)
                                    .clipShape(Circle())
                                    .foregroundColor(.gray)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .padding(.top, 20)
                        Spacer()
                    }
                }
                Section(header: Text(ProfileConstants.sectionTitle)) {
                    InfoRow(title: ProfileConstants.userNameTitle, value: authCachedModel.first?.userName ?? "")
                    InfoRow(title: ProfileConstants.firstNameTitle, value: authCachedModel.first?.firstName ?? "")
                    InfoRow(title: ProfileConstants.lastNameTitle, value: authCachedModel.first?.lastName ?? "")
                    InfoRow(title: ProfileConstants.genderTitle, value: authCachedModel.first?.gender ?? "")
                    InfoRow(title: ProfileConstants.emailTitle, value: authCachedModel.first?.email ?? "")
                }
                Section {
                    Button(action: {
                        clearDatabase()
                        isShowingLogin = true
                    }) {
                        Text("Sign Out")
                            .foregroundColor(.red)
                    }
                }
            }.fullScreenCover(isPresented: $isShowingLogin) {
                LoginViewFactory.createLoginView()
            }
            .navigationBarTitle(ProfileConstants.viewTitle, displayMode: .large)
            .onAppear {
                if authCachedModel.first?.image == nil || authCachedModel.first?.image?.isEmpty == true {
                    showDefaultImage = true
                }
            }
        }
    }
    private func clearDatabase() {
          let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "AuthSavedModel")
          let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

          do {
              try context.execute(batchDeleteRequest)
              try context.save() // Save the context to persist the changes
          } catch {
              // Handle the error
              print("Error clearing database: \(error.localizedDescription)")
          }
      }
}
