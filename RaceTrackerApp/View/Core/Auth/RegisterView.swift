//
//  RegisterView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 01/04/2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var emailText: String = ""
    @State private var usernameText: String = ""
    @State private var fullNameText: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .center){
            Color.backGround.ignoresSafeArea()
            
            VStack(alignment: .center,spacing: 15){
                Spacer()
                
                CustomTextField(placeholder: "Email", inputText: $emailText)
                
                CustomTextField(placeholder: "Username", inputText: $usernameText)
                
                CustomTextField(placeholder: "Full name", inputText: $fullNameText)

                CustomAuthButton(isSignInButton: false, void: {
                    print("sign up tapped")
                })
                .padding(.top)
                
                Spacer()
               
                CustomAuthNavigation(willNavigate: false)
                

            }
        }
        .navigationBarBackButtonHidden()
    }
}



#Preview {
    RegisterView()
}
