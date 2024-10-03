//
//  InboxViewModel.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 03/10/2024.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth


class InboxViewModel: ObservableObject{
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    init(){
        setupSubscriber()
    }
    
    private func setupSubscriber(){
        UserService.shared.$currentUser.sink{ [weak self] user in
            self?.currentUser = user
            
        }.store(in: &cancellables)
    }
}
