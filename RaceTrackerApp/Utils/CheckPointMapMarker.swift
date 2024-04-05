//
//  CustomMapMarker.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 01/04/2024.
//

import SwiftUI

enum CustomMapMarkerSection {
    case start
    case checkpoint
    case end
}
struct CheckPointMapMarker: View {
    @Binding var isCheckpoint: CustomMapMarkerSection
    var body: some View {
        VStack(spacing: -10){
            switch isCheckpoint {
            case .start:
                Circle()
                    .foregroundStyle(.green)
                    .frame(height: 50)
                    .overlay(
                        Image(systemName: "flag.fill")
                            .imageScale(.large)
                            .foregroundStyle(.white)
                    )
                
                Triangle()
                    .foregroundStyle(.green)
                    .frame(width: 30, height: 30)
                    .rotationEffect(.degrees(180))
                
            case .checkpoint:
                Circle()
                    .foregroundStyle(.blue)
                    .frame(height: 50)
                    .overlay(
                        Image(systemName: "trophy.fill")
                            .imageScale(.large)
                            .foregroundStyle(.white)
                    )
                
                Triangle()
                    .foregroundStyle(.blue)
                    .frame(width: 30, height: 30)
                    .rotationEffect(.degrees(180))
            case .end:
                Circle()
                    .foregroundStyle(.red)
                    .frame(height: 50)
                    .overlay(
                        Image(systemName: "flag.checkered.2.crossed")
                            .imageScale(.large)
                            .foregroundStyle(.white)
                    )
                
                Triangle()
                    .foregroundStyle(.red)
                    .frame(width: 30, height: 30)
                    .rotationEffect(.degrees(180))
            }
        }
    }
}

private extension CheckPointMapMarker{
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()

            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

            return path
        }
    }
}
#Preview {
    CheckPointMapMarker(isCheckpoint: .constant(.start))
}
