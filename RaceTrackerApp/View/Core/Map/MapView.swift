//
//  MapView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 01/04/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        ZStack(alignment: .top){
            Map{
                Annotation("", coordinate: CLLocationCoordinate2D(latitude: 45.04, longitude: 35.15)){
                    CheckPointMapMarker(isCheckpoint: .constant(.start))
                }
                
                Annotation("", coordinate: CLLocationCoordinate2D(latitude: 45.00, longitude: 35.15)){
                    CheckPointMapMarker(isCheckpoint: .constant(.checkpoint))
                }
                
                Annotation("", coordinate: CLLocationCoordinate2D(latitude: 44.94, longitude: 35.10)){
                    CheckPointMapMarker(isCheckpoint: .constant(.end))
                }
                
            }
               // .clipShape(RoundedRectangle(cornerRadius: 25))
               // .padding(.top)
               // .padding(.bottom, 150)
            
           //MARK: - Mini info
            VStack{
                Text("01:09:44")
                    .font(.largeTitle)
                
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
            .frame(width: UIScreen.main.bounds.width - 32 ,height: 150)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.ultraThinMaterial)
                    .shadow(color: .black,radius: 10, x: 5, y: 5)
            )
        }
    }
}

#Preview {
    MapView()
}
