//
//  MiniInfoView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 06/04/2024.
//

import SwiftUI

struct MiniInfoView: View {
    @Binding var isTapped: Bool
    @StateObject var viewModel: LocationService
    
    var body: some View {
        VStack(spacing: 25){
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
                    MiniInfoSection(imageName: "mappin", value: viewModel.route?.distance ?? 0, unit: "M", colorOne: .primary, colorTwo: .secondary)
                    MiniInfoSection(imageName: "flame.fill", value: 0, unit: "kCal",colorOne: .orange, colorTwo: .red)
                    MiniInfoSection(imageName: "gauge.with.dots.needle.67percent", value: 0, unit: "KM/H", colorOne: .black, colorTwo: .blue)

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
    MiniInfoView(isTapped: .constant(true), viewModel: LocationService())
}

struct MiniInfoSection: View {
    let imageName: String
    let value: Double
    let unit: String
    let colorOne: Color
    let colorTwo: Color
    
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .foregroundStyle(colorOne, colorTwo)
                .font(.system(size: 20))
            
            VStack{
                Text("\(value,specifier: "%.1f")")
                    .font(.subheadline)
                Text(unit)
                    .font(.footnote)
                    
            }
            .fontWeight(.semibold)
            .padding(.horizontal)
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.bar)
                .frame(width: 100,height: 50)
        )
    }
}
