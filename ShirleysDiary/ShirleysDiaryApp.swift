//
//  DearDiaryApp.swift
//  DearDiary
//
//  Created by Aven Au on 19/1/2025.
//

import SwiftUI
import SwiftData

@main
struct ShirleysDiaryApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
            HomePage()
        }
        .modelContainer(for: DiaryEntry.self)
    }
}
