//
//  CustomAuthNavigation.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 06/04/2024.
//

import SwiftUI

struct CustomAuthNavigation: View {
    @Environment(\.dismiss) var dismiss
    let willNavigate: Bool
    
    var body: some View {
        if willNavigate {
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
    CustomAuthNavigation(willNavigate: true)
}
