//
//  ContentViewModel.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 04/04/2024.
//

//import Firebase
//import Combine

//class ContentViewModel: ObservableObject {
//    @Published var userSession: Firebase.User?
//    private var cancellables = Set<AnyCancellable>()
//    
//    init(){
//        setupSubscibers()
//    }
//    
//    func setupSubscibers() {
//        AuthService.shared.$userSession.sink { [weak self] userSession in
//            self?.userSession = userSession
//        }
//        .store(in: &cancellables)
//    }
//}
