//
//  AuthenticationService.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 06.11.2021.
//

import Foundation

class AuthenticationService: ObservableObject {
    var authStatus: SignInState = .initial
    var user: User
    
    init(user: User) {
        self.user = user
    }
}
