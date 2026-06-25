//
//  SharedContainer.swift
//  Interactive
//
//  Created by Parth Patel on 2026-06-24.
//

import Foundation
import SwiftData

class SharedContainer {
	
	static let shared = SharedContainer()
	let container: ModelContainer
	
	init() {
		let schema = Schema([ToDoModel.self])
		let config = ModelConfiguration(
			"Interactive",
			schema: schema,
			url: FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.pp.Interactive")!
				.appendingPathComponent("Interactive.sqlite")
		)
		self.container = try! ModelContainer(for: schema, configurations: config)
	}
}
