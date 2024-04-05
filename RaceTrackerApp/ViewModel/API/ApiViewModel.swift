////
////  ApiViewModel.swift
////  RaceTrackerApp
////
////  Created by Turdesan Csaba on 04/04/2024.
////
//
//import Foundation
//import Combine
//
//class ApiViewModel: ObservableObject{
//    @Published var allData: [CurrentUser] = []
//    
//    let service: ApiService
//    
//    init(service: ApiService) {
//        self.service = service
//        Task { try await apiCall() }
//    }
//    
//
//    func apiCall() async throws{
//        try await service.getRequest { datas, error in
//            self.allData = datas
//            print(self.allData.count)
//        }
//    }
//}
