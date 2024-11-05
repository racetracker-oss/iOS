//
//  Annotations.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 06/04/2024.
//

import Foundation
import MapKit

struct Annotations: Identifiable, Codable {
    var id: Int
    let latitude: Double
    let longitude: Double
    var coordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    var type: CustomMapMarkerSection {
        return CustomMapMarkerSection.checkpoint
    }
}

let annotations_mock_data: [Annotations] = [
    Annotations(id: 0, latitude: 52.52, longitude: 13.40),
    Annotations(id: 0, latitude: 45.14, longitude: 35.05),
    Annotations(id: 0, latitude: 45.24, longitude: 35.10)
]

