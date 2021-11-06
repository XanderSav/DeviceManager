//
//  AuthViewModel.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 06.11.2021.
//

import Foundation

class AuthViewModel: ObservableObject {
    var authService: AuthenticationService?
    
    func initialize(authService: AuthenticationService){
        self.authService = authService
    }
}
