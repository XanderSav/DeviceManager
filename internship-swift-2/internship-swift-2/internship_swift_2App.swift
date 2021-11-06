//
//  internship_swift_2App.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 22.10.2021.
//

import SwiftUI

@main
struct internship_swift_2App: App {
    
    @StateObject var authService: AuthenticationService
    
    init() {
        _authService = StateObject(wrappedValue: AuthenticationService(user: User()))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
