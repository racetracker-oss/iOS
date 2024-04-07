//
//  CustomAuthNavigation.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 06/04/2024.
//

import SwiftUI

struct AuthNavigation: View {
    @Environment(\.dismiss) var dismiss
    var isNavigationLink: Bool?
    
    var body: some View {
        if isNavigationLink == true {
            NavigationLink {
                RegisterView()
            } label: {
                Text("Don't you have an account? ")
                    .foregroundStyle(.gray) +
                
                Text(" Sign up!")
                    .foregroundStyle(.orange)
                    .bold()
            }
        } else {
            Button(action: {
                dismiss()
            }, label: {
                Text("Already have you an account? ")
                    .foregroundStyle(.gray) +
                
                Text(" Sign in!")
                    .foregroundStyle(.orange)
                    .bold()
            })
        }
    }
}

#Preview {
    AuthNavigation(isNavigationLink: true)
}
