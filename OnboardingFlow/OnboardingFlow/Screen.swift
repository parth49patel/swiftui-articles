//
//  OnboardingView.swift
//  OnboardingFlow
//
//  Created by Parth Patel on 2026-06-03.
//

import SwiftUI

struct Screen: View {
	
	let bgColor: Color
	let title: String
	let buttonText: String
	let buttonAction: () -> Void
	
	var body: some View {
		ZStack {
			Color(bgColor).opacity(0.5).ignoresSafeArea()
			VStack(spacing: 20) {
				Spacer()
				Text(title)
					.font(.title)
				Spacer()
				Button {
					buttonAction()
				} label: {
					Text(buttonText)
						.font(.title2)
						.padding()
				}
				.buttonSizing(.flexible)
				.buttonStyle(.glass)
				.padding(.horizontal)
			}
			.fontWeight(.semibold)
			.fontDesign(.rounded)
		}
	}
}

#Preview {
	Screen(bgColor: .blue, title: "Medium Article", buttonText: "Next", buttonAction: { } )
}
