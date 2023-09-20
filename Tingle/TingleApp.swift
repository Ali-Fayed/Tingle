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
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
