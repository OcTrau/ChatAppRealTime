//
//  AuthService.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 29/09/2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore



class AuthService{
//    service for User Session
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
//    init(userSession: FirebaseAuth.User) {
//        self.userSession = userSession
//    }
    
    init(){
        self.userSession = Auth.auth().currentUser

        loadCurrentUserData()
        print("Bug: User session id is \(userSession?.uid)")
    }
    
    
    @MainActor
//    service for loginView
    func login(withEmail email: String, password: String) async throws{
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUserData()
        } catch {
            print("Bug: Failed to login User with Error \(error.localizedDescription)")
        }
    }
    @MainActor
//    service for registerView
    func createUser(withEmail email: String, password: String, fullname: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.upLoadUserData(email: email, fullname: fullname, id: result.user.uid)
            loadCurrentUserData()
            
            
        }catch{
            print("Bug: Failed to create User with error \(error.localizedDescription)")
            
        }
    }
    
//    service for logoutUser
    func signOut(){
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            UserService.shared.currentUser = nil 
        } catch {
            print("Bug: SignOut Failed from \(error.localizedDescription)")
        }
    }
    
    
//    Service upload information of user
    private func upLoadUserData(email: String, fullname: String, id: String) async throws {
        let user = User(fullname: fullname, email: email, profileImageURL: nil)
//        guard let encodedUser = try? Firestore.Endcoded().encoded(user) else {return}
//        try await Firestore.firestore().collection("user").document(id).setData(user)
//        do {
//            let encoder = JSONEncoder()
//                let data = try encoder.encode(user)
//                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
//            
//                let user = json
//            
//            let encodedData = try Firestore.Encoder().encode(user)
//            
//            
//    
//            try await Firestore.firestore().collection("users").document(id).setData(json!)
//            } catch {
//                print("Error encoding user:", error)
//        }
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
        
    }
    
    private func loadCurrentUserData(){
        Task{
            try await UserService.shared.fetchCurrentUser()
        }
    }
    
    
    
}
