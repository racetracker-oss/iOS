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
    
    @State private var destination: CLLocationCoordinate2D?
    
    @State private var route: MKRoute?
    @State private var routeDisplaying = false
    @State private var getDirections = false
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Map(scope: mapScope){
                UserAnnotation(anchor: .top)
                
                ForEach(annotations_mock_data) { anno in
                    Annotation("", coordinate: anno.coordinates) {
                        CheckPointMapMarker(isCheckpoint: .constant(.checkpoint))
                            .onTapGesture {
                                Task{
                                    try await Task.sleep(nanoseconds: 200_000_000)
                                    try await viewModel.getDirection(endLocation: anno.coordinates)
                                    self.destination = anno.coordinates
                                    withAnimation(.snappy) {
                                        self.routeDisplaying.toggle()
                                    }
                                }
                            }
                          
                    }
                }
                .annotationTitles(.hidden)
                
                if let route = viewModel.route{
                    MapPolyline(route.polyline)
                        .stroke(.blue, lineWidth: 6)
                }
                
            }
            .mapStyle(.imagery(elevation: .realistic))
            .mapControls{
                MapUserLocationButton()
            }
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
            MiniInfoView(isTapped: $dropdownMenuTapped, viewModel: viewModel)
                .padding(.top, 3)
                .padding(.horizontal,8)
        }
    }
}

#Preview {
    MapView()
}


