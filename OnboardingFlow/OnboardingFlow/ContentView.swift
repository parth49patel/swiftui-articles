//
//  ContentView.swift
//  OnboardingFlow
//
//  Created by Parth Patel on 2026-06-03.
//

import SwiftUI

struct ContentView: View {
	
	@AppStorage("onboardingCompleted") private var onboardingCompleted: Bool = false
	@State private var showOnboarding: Bool = false
	
	var body: some View {
		if onboardingCompleted {
			bodyView
		} else {
			OnboardingFlow()
		}
    }
	
	// MARK: - Body View
	private var bodyView: some View {
		ZStack {
			LinearGradient(
				colors: [.blue.opacity(0.1), .blue.opacity(0.3), .blue.opacity(0.5)],
				startPoint: .top,
				endPoint: .bottom
			)
			.ignoresSafeArea()
			
			VStack(spacing: 20) {
				
				Image(systemName: "swift")
					.font(.system(size: 100))
				Text("Hello, world!")
					.font(.title)
				Text("Welcome to the Medium Article on Onboarding Flow!")
					.font(.title2)
			}
			.multilineTextAlignment(.center)
			.fontWeight(.semibold)
			.fontDesign(.rounded)
		}
	}
}

#Preview {
    ContentView()
}
