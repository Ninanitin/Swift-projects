//
//  Lab6CoreDataApp.swift
//  Lab6CoreData
//
//  Created by Saatvik Rao on 3/31/23.
//

import SwiftUI

@main
struct Lab6CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
