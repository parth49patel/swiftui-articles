//
//  ContentView.swift
//  CustomViewModifiers
//
//  Created by Parth Patel on 2026-05-26.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		
//		Text("iOS Development")
//			.font(.title)
//			.bold()
//			.foregroundStyle(.blue)
//			.padding(10)
//			.background(
//				RoundedRectangle(cornerRadius: 12)
//					.stroke(Color.secondary, lineWidth: 3)
//			)
		
		Text("iOS Development")
			.textWrap(isHighlighted: true)
    }
}

struct TextWrap: ViewModifier {
	var isHighlighted: Bool = false
	
	func body(content: Content) -> some View {
		content
			.font(.title)
			.bold()
			.foregroundStyle(isHighlighted ? .blue : .secondary)
			.padding(10)
			.background(
				RoundedRectangle(cornerRadius: 12)
					.stroke(Color.secondary, lineWidth: 3)
			)
	}
}

extension View {
	func textWrap(isHighlighted: Bool = false) -> some View {
		self.modifier(TextWrap(isHighlighted: isHighlighted))
	}
}

#Preview {
    ContentView()
}
