//
//  ToggleIntent.swift
//  Interactive
//
//  Created by Parth Patel on 2026-06-24.
//

import AppIntents
import WidgetKit
import SwiftData

struct ToggleIntent: AppIntent {
	static var title: LocalizedStringResource = "Toggle"
	
	@Parameter(title: "ToDo")
	var title: String
	
	init() { }
	
	init (title: String) {
		self.title = title
	}
	
	func perform() async throws -> some IntentResult {
		let container = await SharedContainer.shared.container
		let context = ModelContext(container)
		let todos = try context.fetch(FetchDescriptor<ToDoModel>())
		
		if let todo = todos.first(where: { $0.title == title }) {
			todo.isCompleted.toggle()
			try context.save()
		}
		return .result()
	}
}
