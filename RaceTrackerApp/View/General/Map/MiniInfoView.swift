//
//  MiniInfoView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 06/04/2024.
//

import SwiftUI

struct MiniInfoView: View {
    @Binding var isTapped: Bool
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "chevron.right")
                    .rotationEffect(.degrees(isTapped ? 90 : 0))
                
                Spacer()
                
                Text("01:09:44")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .fontDesign(.monospaced)
                Spacer()
            }
            .padding(.horizontal)
            
            if isTapped{
                HStack(spacing: 15){
                    ForEach(0..<3){ _ in
                        HStack{
                            Image(systemName: "person.fill")
                                .imageScale(.large)
                            
                            VStack{
                                Text("10.9")
                                Text("KM")
                                    .font(.footnote)
                            }
                            .padding()
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.bar)
                                .frame(height: 50)
                        )
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 70 ,height: isTapped ? 150 : 50)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
                .shadow(color: .black,radius: 10, x: 5, y: 5)
        )
        .onTapGesture {
            withAnimation(.snappy) {
                isTapped.toggle()
            }
        }
    }
}

#Preview {
    MiniInfoView(isTapped: .constant(true))
}
