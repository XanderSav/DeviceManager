//
//  internship_swift_2App.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 22.10.2021.
//

import SwiftUI
import Firebase
import AppCenter
import AppCenterCrashes

@main
struct internship_swift_2App: App {
    
    @StateObject var authService: AuthenticationService
    
    init() {
        _authService = StateObject(wrappedValue: AuthenticationService(user: User()))
        setupFirebase()
        setupAppcenter()
    }
    
    var body: some Scene {
        WindowGroup {
            InitialView()
                .environmentObject(authService)
        }
    }
}

extension internship_swift_2App {
    private func setupFirebase() {
        FirebaseApp.configure()
    }
    
    private func setupAppcenter() {
        AppCenter.start(withAppSecret: "37d4f822-7ded-402b-af8c-e75bf313c4fe", services:[
          Crashes.self
        ])
    }
}
