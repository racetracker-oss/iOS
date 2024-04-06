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
    
    var body: some View {
        ZStack(alignment: .top){
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
            .padding(.top, 65)
            //.padding(.bottom, 165)
        }
    }
}

#Preview {
    MapView()
}


