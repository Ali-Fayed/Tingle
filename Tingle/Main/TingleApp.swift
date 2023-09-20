//
//  TingleApp.swift
//  Tingle
//
//  Created by Ali Fayed on 20/09/2023.
//

import SwiftUI

@main
struct TingleApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            AuthenticationView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
