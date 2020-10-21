//
//  MapApp.swift
//  Map
//
//  Created by Nitin Bhatt on 10/21/20.
//

import SwiftUI

@main
struct MapApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
