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
        ZStack{
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
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(.top)
                .padding(.bottom, 150)
        }
    }
}

#Preview {
    MapView()
}
