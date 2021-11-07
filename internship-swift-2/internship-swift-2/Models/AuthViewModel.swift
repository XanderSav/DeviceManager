//
//  AuthViewModel.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 06.11.2021.
//

import Foundation

class AuthViewModel: ObservableObject {
    var authService: AuthenticationService?
    
    @Published var errorMessage: String?
    @Published var showError: Bool = false
    
    func initialize(authService: AuthenticationService){
        self.authService = authService
        handleErrorCallback()
    }
    
    func signIn() {
        authService?.signIn()
    }
    
    func checkAuth() {
        authService?.checkAuth()
    }
    
    func dismissErrorPopup() {
        authService?.authStatus = .signedOut
    }
    
    private func handleErrorCallback() {
        authService?.errorHandler = {[weak self] err in
            if(err != nil) {
                self?.errorMessage = err?.localizedDescription
                self?.showError = true
            }
        }
    }
}
