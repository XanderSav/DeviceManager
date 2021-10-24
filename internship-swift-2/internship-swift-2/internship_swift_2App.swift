//
//  internship_swift_2App.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 22.10.2021.
//

import SwiftUI
import Firebase

@main
struct internship_swift_2App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
