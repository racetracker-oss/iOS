//
//  ProfileView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 01/04/2024.
//

import SwiftUI

struct ProfileView: View {
       
    var body: some View {
        VStack {
            Text("profile")
                .font(.largeTitle)
                .foregroundStyle(.green)
            
            Button(action: {
                withAnimation {
                   // AuthService.shared.signOut()
                }
            }, label: {
                Text("Sign out")
            })
            .frame(width: UIScreen.main.bounds.width - 32 ,height: 50)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.orange)
                
            )
        }
    }
}

#Preview {
    ProfileView()
}
