//
//  ViewModel.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 24.10.2021.
//

import Foundation
import SwiftUI

class AuthViewModel: NSObject, ObservableObject {
    var authService: AuthService?
    
    @Published var state: SignInState = .initial
    @Published var errorMessage: String?
    @Published var showError: Bool = false
    
    override init() {
        super.init()
    }
    
    func initialize(authService: AuthService){
        self.authService = authService
        handleAuthCallback()
        checkAuth()
    }
    
    func dismissErrorPopup() {
        state = .signedOut
    }
    
    func signIn() {
        authService?.signIn()
    }
    
    func signOut() {
        authService?.signOut()
    }
    
    private func checkAuth() {
        authService?.checkAuth()
    }
    
    private func handleAuthCallback() {
        authService?.completionHandler = {[weak self] state, err in
            if(err != nil) {
                self?.errorMessage = err?.localizedDescription
                self?.showError = true
            }
            self?.state = state
        }
    }
}
