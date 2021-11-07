//
//  InitialView.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 06.11.2021.
//

import SwiftUI

struct InitialView: View {
    @EnvironmentObject var authService: AuthenticationService
    
    var body: some View {
        switch authService.authStatus {
        case .initial: AuthView()
        case .signedIn: MainView()
        case .signedOut: AuthView()
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView().environmentObject(AuthenticationService(user: User(email: "", uid: "")))
    }
}
