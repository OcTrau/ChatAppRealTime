//
//  ContentViewModel.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 29/09/2024.
//

import Firebase
import FirebaseAuth
import Combine


class ContentViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    
    init(){
        setupSubscriber()
    }
    
    private func setupSubscriber(){
        AuthService.shared.$userSession.sink{ [weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
            
        }.store(in: &cancellables)
        
    }
     
    
}
