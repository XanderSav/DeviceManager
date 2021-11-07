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
        ZStack {
            VStack {
                Spacer()
                
                Text("Welcome to DeviceManager!")
                    .fontWeight(.black)
                    .foregroundColor(Color(.systemIndigo))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Text("Simple tool to make life better")
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                Button("Sign in with Google") {
                    viewModel.signIn()
                }
                .buttonStyle(AuthenticationButtonStyle())
            }
            .alert(isPresented: $viewModel.showError, content: {
                Alert(title: Text("Error"),
                      message: Text(viewModel.errorMessage!),
                      dismissButton: .default(Text("OK"), action:{viewModel.dismissErrorPopup()}))
            })
            switch(authService.authStatus){
            case .initial:
                ProgressIndicator()
            case .signedIn:
                EmptyView()
            case .signedOut:
                EmptyView()
            }
        }
        .onAppear(perform: {
            viewModel.initialize(authService: authService)
            viewModel.checkAuth()
        })
    }
}

struct AuthenticationButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemIndigo))
            .cornerRadius(12)
            .padding()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(AuthenticationService(user: User(email: "", uid: "")))
    }
}
