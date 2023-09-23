//
//  SplashView.swift
//  Tingle
//
//  Created by Ali Fayed on 23/09/2023.
//

import SwiftUI
import CoreData

struct SplashView: View {
    // MARK: - CoreData
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: AuthSavedModel.entity(), sortDescriptors: [], predicate: nil
    ) var authCachedModel: FetchedResults<AuthSavedModel>
    // MARK: - View Body
    var body: some View {
        if authCachedModel.first?.token == nil {
            withAnimation {
                LoginViewFactory.createLoginView()
            }
        } else {
            withAnimation {
                TabBarView()
            }
        }
    }
}
// MARK: - Preview
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewFactory.createLoginView()
    }
}
