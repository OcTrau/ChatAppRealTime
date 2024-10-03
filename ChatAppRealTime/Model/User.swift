//
//  User.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 25/09/2024.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var profileImageURL: String?

    var id: String{
        return uid ?? NSUUID().uuidString
    }
}

extension User{
    static let MOCK_User = User(fullname: "Ronado UR", email: "ronado@gmail.com", profileImageURL: "batman")
}
