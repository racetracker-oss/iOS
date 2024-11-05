//
//  CustomAuthNavigation.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 06/04/2024.
//

import SwiftUI

struct AuthNavigation: View {
    @Environment(\.dismiss) var dismiss
    var isNavigationLink: Bool = false
    
    var body: some View {
        if isNavigationLink {
            NavigationLink {
                RegisterView()
            } label: {
                authText("Don't you have an account?", actionText: "Sign up!")
            }
        } else {
            Button {
                dismiss()
            } label: {
                authText("Already have an account?", actionText: "Sign in")
            }

        }
        
    }
    private func authText(_ mainText: String, actionText: String) -> some View {
        Text(mainText)
            .foregroundStyle(.gray) +
        
        Text(" \(actionText)")
            .foregroundStyle(.orange)
            .bold()
    }
}



#Preview {
    AuthNavigation(isNavigationLink: true)
}
