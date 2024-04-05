//
//  RectangleLogoView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 02/04/2024.
//

import SwiftUI

struct RectangleLogoView: View {
    @State private var circleAnimation = false
    
    var body: some View {
        ZStack(alignment: .top){
            VStack{
                ForEach(0..<8){ _ in
                    Circle()
                        .fill(Color(red: Double.random(in: 0...300)/300, green: Double.random(in: 0...300)/300, blue: Double.random(in: 0...300)/300))
                    
                        .frame(height: CGFloat.random(in: 0...100))
                        .offset(x: CGFloat.random(in: -300...100), y: CGFloat.random(in: -300...100))
                    
                        .blur(radius: 5)
                        .shadow(radius: 10)
                        .animation(.easeInOut.speed(Double.random(in: 0.01...0.05)).repeatForever(autoreverses: true), value: circleAnimation)
                }
                Spacer()
            }
        }
        .onAppear{
            withAnimation {
                circleAnimation.toggle()
            }
        }
    }
}

#Preview {
    RectangleLogoView()
}
