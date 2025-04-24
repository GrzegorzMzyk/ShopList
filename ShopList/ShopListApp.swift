//
//  ShopListApp.swift
//  ShopList
//
//  Created by Grzegorz Mzyk on 07/04/2025.
//

import SwiftUI
import SwiftData

@main
struct ShopListApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Items.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainScreen()
                .modelContainer(for: Items.self)
        }
        
    }
}
