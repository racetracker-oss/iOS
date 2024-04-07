//
//  MainTabSelection.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 07/04/2024.
//

import Foundation

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
