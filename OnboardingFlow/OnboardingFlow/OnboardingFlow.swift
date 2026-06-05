//
//  OnboardingFlow.swift
//  OnboardingFlow
//
//  Created by Parth Patel on 2026-06-04.
//

import SwiftUI

struct OnboardingFlow: View {
	
	@AppStorage("onboardingCompleted") private var onboardingCompleted: Bool = false
	@Environment(\.dismiss) private var dismiss
	@State private var currentScreen: Int = 0
	
    var body: some View {
		switch currentScreen {
			case 0:
				Screen(
					bgColor: .mint,
					title: "Screen 1 of 3",
					buttonText: "Next",
					buttonAction: { currentScreen = 1 }
				)
				
			case 1:
				Screen(
					bgColor: .teal,
					title: "Screen 2 of 3",
					buttonText: "Next",
					buttonAction: { currentScreen = 2 }
				)
				
			case 2:
				Screen(
					bgColor: .cyan,
					title: "Screen 3 of 3",
					buttonText: "Complete",
					buttonAction: {
						onboardingCompleted = true
						dismiss()
					}
				)
				
			default:
				Screen(bgColor: .blue, title: "Screen 1 of 3", buttonText: "Next", buttonAction: { currentScreen = 1 } )
		}
    }
}

#Preview {
    OnboardingFlow()
}
