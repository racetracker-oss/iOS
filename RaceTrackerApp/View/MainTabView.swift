//
//  MainTabView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 01/04/2024.
//

import SwiftUI

enum MainTabSelection: Int, CaseIterable, Identifiable {
    case home
    case map
    case barcode
    case statistics
    case profile
    
    var imageName: String {
        switch self {
        case .home:
            return "house.fill"
        case .map:
            return "map.fill"
        case .barcode:
            return "barcode"
        case .statistics:
            return "figure.outdoor.cycle"
        case .profile:
            return "person.fill"
        }
    }
    
    var id: Int {return self.rawValue}
}

struct MainTabView: View {
    @State private var selectedIndex = 0
    @State private var symbolAnimate = false
    @State private var rotation: Double = 0.0
    
    var body: some View {
        ZStack{
            Color.backGround.ignoresSafeArea()
            
            switch selectedIndex {
            case 0:
                HomeView()
            case 1:
                MapView()
            case 2:
                // BarcodeView()
                CustomBarode()
            case 3:
                StatisticsView()
            case 4:
                ProfileView()
            default:
                ProgressView()
                
            }
            
            VStack{
                Spacer()
                
                HStack(spacing: 12){
                    ForEach(MainTabSelection.allCases){ section in
                        Button(action: {
                            withAnimation(.snappy.speed(2)){
                                selectedIndex = section.rawValue
                                symbolAnimate.toggle()
                            }
                        }, label: {
                            ZStack{
                                Circle()
                                    .frame(height: 55)
                                    .foregroundStyle(selectedIndex == section.rawValue ? .orange : .tab)
                                
                                Image(systemName: section.imageName)
                                    .symbolEffect(.bounce, value: symbolAnimate)
                                    .font(.system(size: selectedIndex == section.rawValue ? 28 : 22))
                                
                                    .foregroundStyle(selectedIndex == section.rawValue ? .white : .orange)
                            }
                        })
                        .offset(y: selectedIndex == section.rawValue ? -8 : 0)
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

//struct TabShape: Shape{
//    var midpoint: CGFloat
//
//    func path(in rect: CGRect) -> Path {
//        return Path { path in
//            path.addPath(Rectangle().path(in: rect))
//            path.move(to: .init(x: midpoint - 60, y: 0))
//
//            let to = CGPoint(x: midpoint, y: -25)
//            let control1 = CGPoint(x: midpoint - 25, y: 0)
//            let control2 = CGPoint(x: midpoint - 25, y: -25)
//
//            path.addCurve(to: to, control1: control1, control2: control2)
//
//            let to1 = CGPoint(x: midpoint + 60, y: 0)
//            let control3 = CGPoint(x: midpoint + 25, y: -25)
//            let control4 = CGPoint(x: midpoint + 25, y: 0)
//
//            path.addCurve(to: to1, control1: control3, control2: control4)
//
//        }
//    }
//}

#Preview {
    MainTabView()
}
