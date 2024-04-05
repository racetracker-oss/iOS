//
//  AuthService.swift
//  RaceTrackerApp
//
//  Created by Turdesan Csaba on 04/04/2024.
//

//import Foundation
//import Firebase
//import FirebaseFirestore
//
//class AuthService {
//    @Published var userSession: Firebase.User?
//    
//    static let shared = AuthService()
//    
//    @MainActor
//    func login(withEmail email: String, password: String) async throws {
//        do {
//            let result = try await  Auth.auth().signIn(withEmail: email, password: password)
//            self.userSession = result.user
//            //self.loadCurrentUserData()
//        } catch{
//            print("DEBUG: FAILED TO SIGN IN USER WITH THIS: \(error.localizedDescription)")
//        }
//    }
//    @MainActor
//    func createUser(withEmail email: String, password: String, fullname: String) async throws {
//        do {
//            let result = try await Auth.auth().createUser(withEmail: email, password: password)
//            self.userSession = result.user
//            //try await self.uploadUserData()
//            //self.loadCurrentUserData()
//        } catch {
//            print("DEBUG: FAILED TO CREATE USER WITH THIS: \(error.localizedDescription)")
//        }
//    }
//    
//    func signOut(){
//        do {
//            try Auth.auth().signOut()
//            self.userSession = nil
//        } catch {
//            print("DEBUG: FAILED TO SIGN OUT \(error.localizedDescription)")
//        }
//    }
    
//    func uploadUserData(email: String, fullname: String, id: String) async throws {
//        let user = CurrentUser()
//        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
//
//    }
    
//    private func loadCurrentUserData() {
//        Task { try await UserService.shared.fetchCurrentUser() }
//    }
//}
