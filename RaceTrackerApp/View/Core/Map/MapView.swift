//
//  MapView.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 01/04/2024.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @ObservedObject var viewModel = LocationService()
    @Namespace var mapScope
    @State private var dropdownMenuTapped = false
    
    var body: some View {
        ZStack(alignment: .topLeading){
                Map(scope: mapScope){
                    UserAnnotation(anchor: .top)
                    
                    ForEach(annotations_mock_data) { anno in
                        Annotation("", coordinate: anno.coordinates) {
                            CheckPointMapMarker(isCheckpoint: .constant(.checkpoint))
                        }
                        .annotationTitles(.hidden)
                        
                    }
                }
                .mapStyle(.imagery(elevation: .realistic))
            .mapControls({
                MapUserLocationButton()

            })
            .controlSize(.regular)
            .tint(.primary)
            .alert(isPresented: $viewModel.locationPermissionDenied, content: {
                Alert(title: Text("Permission Denied"),
                      message: Text("Please Enable Permission In App Settings"),
                      dismissButton: .default(Text("Go To Settings"),
                                              action: {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }))
            })
            
            //MARK: - Dropdown Info
            MiniInfoView(isTapped: $dropdownMenuTapped)
            //.padding(.top, 65)
                .padding(.top, 3)
                .padding(.horizontal,8)
                //.padding(.trailing, 50)
        }
    }
}

#Preview {
    MapView()
}


