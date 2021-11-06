//
//  AuthView.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 06.11.2021.
//

import SwiftUI

struct AuthView: View {
    @StateObject private var viewModel = AuthViewModel()
    @EnvironmentObject var authService: AuthenticationService
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                viewModel.initialize(authService: authService)
            })
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
