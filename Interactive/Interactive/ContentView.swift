//
//  ContentView.swift
//  Interactive
//
//  Created by Parth Patel on 2026-06-22.
//

import SwiftUI
import SwiftData
import WidgetKit

@Model
class ToDoModel {
	var title: String
	var isCompleted: Bool
	
	init(title: String, isCompleted: Bool) {
		self.title = title
		self.isCompleted = isCompleted
	}
}

struct ContentView: View {
	
	@Environment(\.dismiss) private var dismiss
	@Environment(\.modelContext) var context
	@Query var todos: [ToDoModel]
	@State private var title: String = ""
	@State private var showAddAlert: Bool = false
	
    var body: some View {
		NavigationStack {
			List {
				ForEach(todos) { todo in
					HStack {
						Button {
							todo.isCompleted.toggle()
						} label: {
							Image(systemName: todo.isCompleted ? "checkmark.circle" : "circle")
								.foregroundStyle(!todo.isCompleted ? .secondary: Color.green)
						}
						Text(todo.title)
					}
					.swipeActions {
						Button(role: .destructive) {
							context.delete(todo)
							WidgetCenter.shared.reloadAllTimelines()
						}
					}
				}
			}
			.navigationTitle("To Do")
			.toolbar {
				ToolbarItem(placement: .confirmationAction) {
					Button("Add") {
						showAddAlert = true
					}
				}
			}
			.alert("Add New", isPresented: $showAddAlert) {
				TextField("Title", text: $title)
				Button("Add") { addNew() }
				Button("Cancel") { dismiss() }
			} message: {
				Text("Please add a new task here.")
			}
		}
    }
	
	private func addNew() {
		let new = ToDoModel(title: title, isCompleted: false)
		context.insert(new)
		WidgetCenter.shared.reloadAllTimelines()
		dismiss()
	}
}

#Preview {
    ContentView()
}
