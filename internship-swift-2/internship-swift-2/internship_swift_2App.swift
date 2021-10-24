//
//  internship_swift_2App.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 22.10.2021.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct internship_swift_2App: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        setupAuthentication()
    }
    
    var body: some Scene {
        WindowGroup {
            InitialView()
                .environmentObject(viewModel)
        }
    }
}

extension internship_swift_2App {
  private func setupAuthentication() {
     FirebaseApp.configure()
     GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
  }
}
