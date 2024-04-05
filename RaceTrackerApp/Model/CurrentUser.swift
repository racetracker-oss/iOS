//
//  CurrentUser.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 04/04/2024.
//

import Foundation

struct CurrentUser: Codable, Identifiable {
    let id: Int
    let email: String
    let fullname: String
}
