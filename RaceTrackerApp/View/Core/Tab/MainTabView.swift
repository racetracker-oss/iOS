//
//  MainTabView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 01/04/2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex: MainTabSelection.AllCases.Element = .home //= 0
    @State private var symbolAnimate = false
    @State private var rotation: Double = 0.0
    
    var body: some View {
        ZStack{
            Color.backGround.ignoresSafeArea()
            
            switch selectedIndex {
            case .home:
                HomeView()
                
            case .map:
                MapView()
                
            case .barcode:
                // BarcodeView()
                CustomBarode()
                
            case .statistics:
                StatisticsView()
                
            case .profile:
                ProfileView()
           
            }
            
            VStack{
                Spacer()
                
                HStack(spacing: 12){
                    ForEach(MainTabSelection.allCases){ section in
                        Button(action: {
                            withAnimation(.snappy.speed(2)){
                                selectedIndex = section
                                symbolAnimate.toggle()
                            }
                        }, label: {
                            ZStack{
                                Circle()
                                    .frame(height: 55)
                                    .foregroundStyle(selectedIndex == section ? .orange : .tab)
                                
                                Image(systemName: section.imageName)
                                    .symbolEffect(.bounce, value: symbolAnimate)
                                    .font(.system(size: selectedIndex == section ? 28 : 22))
                                
                                    .foregroundStyle(selectedIndex == section ? .white : .orange)
                            }
                        })
                        .offset(y: selectedIndex == section ? -8 : 0)
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 32 , height: 90)
                .background(
                    //                    RoundedRectangle(cornerRadius: 25)
                    //                        .stroke(.gray.opacity(0.1),style: StrokeStyle())
                    //                        .foregroundStyle(.tab)
                    //                        .shadow(color: .tab.opacity(0.2), radius: 5 ,x: 0, y: -5)
                    //                        .blur(radius: 2)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: UIScreen.main.bounds.width - 32 ,height: 90)
                            .foregroundStyle(.backGround)
                            .shadow(color: .black,radius: 10, x: 0 , y: 0)
                        
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: UIScreen.main.bounds.width - 30, height: 92)
                            .foregroundStyle(
                                LinearGradient(colors: [.orange.opacity(0.4), .black.opacity(0.4)], startPoint: .top, endPoint: .bottom)
                            )
                            .rotationEffect(.degrees(rotation))
                            .mask {
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .stroke(lineWidth: 3)
                                    .frame(width: UIScreen.main.bounds.width - 32, height: 95)
                            }
                    }
                )
            }
            .onAppear{
                withAnimation(.linear(duration: 3.1).repeatForever(autoreverses: false)){
                    rotation = 360
                }
            }
        }
    }
}


#Preview {
    MainTabView()
}
