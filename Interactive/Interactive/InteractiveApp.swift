//
//  InteractiveApp.swift
//  Interactive
//
//  Created by Parth Patel on 2026-06-22.
//

import SwiftUI
import SwiftData

@main
struct InteractiveApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		.modelContainer(SharedContainer.shared.container)
    }
}
