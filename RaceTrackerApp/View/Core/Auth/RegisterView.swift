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
        ZStack{
            Color.backGround.ignoresSafeArea()
            
            VStack(spacing: 15){
                Spacer()
                
                TextField("Email", text: $emailText)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color(.systemGray6))
                    )
                
                TextField("username", text: $usernameText)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color(.systemGray6))
                    )
                
                TextField("Fullname", text: $fullNameText)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color(.systemGray6))
                    )
                
               
                Button(action: {
                    //
                }, label: {
                    Text("Sign up")
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundStyle(.orange)
                })
                .padding()
                .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        
                        .foregroundStyle(Color(.systemGray6))
                )
                .padding(.top)
                
                Spacer()
                
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
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RegisterView()
}
