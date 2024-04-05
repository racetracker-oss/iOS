////
////  ApiService.swift
////  RaceTrackerApp
////
////  Created by Turdesan Csaba on 04/04/2024.
////
//
//import Foundation
//import Combine
//
//enum ErrorCases: LocalizedError {
//    case invalidurl
//    case invalidStatusCode
//    case decodingerror
//    case parseError
//    case customError(String)
//    
//    var errorDescription: String? {
//        switch self {
//        case .invalidurl:
//            return "invalidurl"
//        case .decodingerror:
//            return "decodingerror"
//        case .parseError:
//            return "parseerror"
//        case .customError(let error):
//            return "Error is: \(error)"
//        case .invalidStatusCode:
//            return "Invalid statusCode"
//        }
//    }
//}
//
//
//class ApiService {
//    @Published var error: ErrorCases?
//    @Published var hasError = false
//    @Published var isLoading = false
//    
//    static let shared = ApiService()
//    var cancellables = Set<AnyCancellable>()
//    
//    func getRequest(completion: @escaping ([CurrentUser],ErrorCases?) -> Void) async throws {
//        isLoading = true
//        defer { isLoading = false }
//
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
//            throw ErrorCases.invalidurl
//        }
//        
//        URLSession.shared.dataTaskPublisher(for: url)
//            .receive(on: DispatchQueue.main)
//            .tryMap { res in
//                guard let response = res.response as? HTTPURLResponse,
//                      response.statusCode >= 200 && response.statusCode <= 300 else {
//                    throw ErrorCases.invalidStatusCode
//                }
//                 
//                 guard let allData = try? JSONDecoder().decode([CurrentUser].self, from: res.data) else {
//                     throw ErrorCases.decodingerror
//                 }
//                                 
//                 return allData
//            }
//            .sink { response in
//                switch response {
//                case .finished:
//                    print("RECEIVED VALUE FINISHED")
//                case .failure(let error):
//                    print("RECEIVED VALUE FAILED: \(error)")
//                }
//            } receiveValue: { currentUser in
//                completion(currentUser, nil)
//            }
//            .store(in: &cancellables)
//
//    }
//}
