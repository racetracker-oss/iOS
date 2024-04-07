//
//  CustomGradient.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 04/04/2024.
//

import SwiftUI

struct TapToScanView: View {
    @State private var rotation: CGFloat = 0.0
    var body: some View {
        ZStack{
            Color.backGround.ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 260, height: 340)
                .foregroundStyle(.black.opacity(0.4))
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
                .blur(radius: 3.0)
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 130, height: 500)
                .foregroundStyle(
                    LinearGradient(colors: [.orange.opacity(0.6), .yellow.opacity(0.6), .pink.opacity(0.6),.black.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                        
                )
                .rotationEffect(.degrees(rotation))
                .mask {
                    RoundedRectangle(cornerRadius: 20,style: .continuous)
                        .stroke(lineWidth: 3)
                        .frame(width: 256, height: 336)
                }
            
            Text("Tap to scan")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .foregroundStyle(.white)

        }
        .onAppear{
            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                rotation = 360
            }
        }
    }
}

#Preview {
    TapToScanView()
}
