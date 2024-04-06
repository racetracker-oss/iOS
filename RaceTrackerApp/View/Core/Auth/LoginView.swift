//
//  LoginView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 01/04/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .center){
                Color.backGround.ignoresSafeArea()
                
                CircleAnimations()
                    .padding(.top, 100)
                
                VStack(spacing: 15){
                    Spacer()
                    
                    CustomTextField(placeholder: "Email", inputText: $email)
                    
                    CustomTextField(placeholder: "Password", inputText: $password, isSecureField: true)
                    
                    VStack{
                        HStack{
                            Spacer()
                            Button(action: {
                                //forgot password
                            }, label: {
                                Text("Forgot your password?")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.orange)
                            })
                            .padding()
                        }
                    }
                    
                    CustomAuthButton(isSignInButton: true) {
                        print("sign in")
                        //  Task { try await viewModel.loginUser() }
                    }
                    
                    Spacer()
                    
                    CustomAuthNavigation(willNavigate: true)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
