//
//  RegisterViewModel.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 29/09/2024.
//

import SwiftUI

class RegisterViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws{
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname)
    }
}
