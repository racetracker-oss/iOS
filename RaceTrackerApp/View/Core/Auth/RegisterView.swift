//
//  RegisterView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 01/04/2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var emailText: String = ""
        
    var body: some View {
        ZStack(alignment: .center){
            Color.backGround.ignoresSafeArea()
            
            VStack(alignment: .center,spacing: 15){
                Spacer()
                
                CustomTextField(placeholder: PlaceholderTypes.email, inputText: $emailText)
                                

                AuthButton(isSignInButton: false, void: {
                    print("sign up tapped")
                })
                .padding(.top)
                
                Spacer()
               
                AuthNavigation()
            
            }
        }
        .navigationBarBackButtonHidden()
    }
}



#Preview {
    RegisterView()
}
