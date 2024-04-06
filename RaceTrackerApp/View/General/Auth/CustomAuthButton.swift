//
//  CustomAuthButton.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 06/04/2024.
//

import SwiftUI

struct CustomAuthButton: View {
    let isSignInButton: Bool
    let void: () -> Void
    
    var body: some View {
        Button(action: {
           
            void()
        }, label: {
            Text(isSignInButton ? "Sign in" : "Sign up")
                
        })
        .modifier(CustomAuthButtonModifier())
    }
}

struct CustomAuthButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundStyle(.orange)
            .fontWeight(.heavy)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 32, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(Color(.systemGray6))
            )
    }
}
