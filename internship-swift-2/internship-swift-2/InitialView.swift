//
//  InitialView.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 24.10.2021.
//

import SwiftUI

struct InitialView: View {
    @EnvironmentObject var authService: AuthService
    
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
        InitialView().environmentObject(AuthService(dataKeeper: UserDataKeeper(email: "aaaa@aaa.aa",
                           uid: "123355378")))
    }
}
