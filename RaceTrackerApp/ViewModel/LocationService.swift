//
//  LocationService.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 06/04/2024.
//

import Foundation
import CoreLocation
//import MapKit
 
class LocationService: NSObject, ObservableObject {
    @Published var locationPermissionDenied = false
    @Published var currentUserLocation: CLLocation?
      
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.permissionsSetup()
       // print("latitude is: \(locationManager.location?.coordinate.latitude)")
       // print("longitude is: \(locationManager.location?.coordinate.longitude)")
        
    }
    
    func permissionsSetup() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            self.locationManager.requestWhenInUseAuthorization()
            
        case .restricted, .denied:
            self.locationPermissionDenied = true
            print("location access restricted or denied.")
            
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.allowsBackgroundLocationUpdates = true
            locationManager.startUpdatingLocation()

        default:
            break
        }
    }
    
}

extension LocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Locationmanager failed with error: \(error.localizedDescription)")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
         guard .authorizedWhenInUse == manager.authorizationStatus else { return }
         locationManager.startUpdatingLocation()
     }
     
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         guard let location = locations.first else { return }
         
         self.currentUserLocation = location
        // print("USERLOCATION LATITUDE IS: \(currentUserLocation?.coordinate.latitude)")
        // print("USERLOCATION LONGITUDE IS: \(currentUserLocation?.coordinate.longitude)")
     }
}
