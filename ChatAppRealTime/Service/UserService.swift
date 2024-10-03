//
//  UserService.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 02/10/2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore


class UserService{
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
        print("Debug: Current User in service is \(currentUser )")
    }
    
    
    
    
}
