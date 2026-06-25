//
//  InteractiveWidget.swift
//  InteractiveWidget
//
//  Created by Parth Patel on 2026-06-24.
//

import WidgetKit
import SwiftUI
import SwiftData
import AppIntents

// MARK: - Timeline Entry
struct InteractiveWidgetEntry: TimelineEntry {
	let date: Date
	let todo: [ToDoModel]
}

// MARK: - Timeline Provider
struct InteractiveWidgetTimelineProvider: TimelineProvider {
	
	func placeholder(in context: Context) -> InteractiveWidgetEntry {
		InteractiveWidgetEntry(date: Date(), todo: [])
	}
	
	func getSnapshot(in context: Context, completion: @escaping (InteractiveWidgetEntry) -> ()) {
		let entry = InteractiveWidgetEntry(date: Date(), todo: [])
		completion(entry)
	}
	
	func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
		let entry = InteractiveWidgetEntry(date: Date(), todo: [])
		completion(Timeline(entries: [entry], policy: .atEnd))
	}
}

// MARK: - Widget View
struct InteractiveWidgetView: View {
	
	var entry: InteractiveWidgetTimelineProvider.Entry
	@Query private var todos: [ToDoModel]
	
	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			ForEach(todos) { todo in
				HStack(spacing: 10) {
					Button(intent: ToggleIntent(title: todo.title)) {
						Image(systemName: todo.isCompleted ? "checkmark.circle" : "circle")
							.foregroundStyle(todo.isCompleted ? .green : .secondary)
					}
					.buttonStyle(.plain)
					
					Text(todo.title)
					Spacer()
				}
			}
		}
		.frame(maxWidth: .infinity, alignment: .leading)
	}
}

// MARK: - Widget Configuration
struct InteractiveWidget: Widget {
	let kind: String = "InteractiveWidget"
	
	var body: some WidgetConfiguration {
		StaticConfiguration(kind: kind, provider: InteractiveWidgetTimelineProvider()) { entry in
			InteractiveWidgetView(entry: entry)
				.modelContainer(SharedContainer.shared.container)
				.containerBackground(.fill.tertiary, for: .widget)
		}
		.configurationDisplayName("To Do's")
		.description("An interactive widget.")
		.supportedFamilies([.systemMedium])
	}
}
