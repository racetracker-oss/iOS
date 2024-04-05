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
  //  @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack{
            ZStack(alignment: .top){
                Color.backGround.ignoresSafeArea()
                RectangleLogoView()
                    .padding(.top, 100)
                    
                
                VStack(spacing: 15){
                    Spacer()
                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(Color(.systemGray6))
                        )
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(Color(.systemGray6))
                        )
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
                    Button(action: {
                      //  Task { try await viewModel.loginUser() }
                            
                    }, label: {
                        Text("Sign in")
                            .font(.title3)
                            .foregroundStyle(.orange)
                            .fontWeight(.heavy)
                    })
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                        
                            .foregroundStyle(Color(.systemGray6))
                    )
                    
                    Spacer()
                    
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Don't you have an account? ")
                            .foregroundStyle(.gray) +
                        
                        Text(" Sign up!")
                            .foregroundStyle(.orange)
                            .bold()
                    }
                    
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
