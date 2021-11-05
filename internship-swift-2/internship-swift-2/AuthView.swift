//
//  ContentView.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 22.10.2021.
//

import SwiftUI

struct AuthView: View {
    @StateObject private var viewModel = AuthViewModel()
    @EnvironmentObject var authService: AuthService
    
    var body: some View {
        ZStack{
            VStack {
                Spacer()
                
                //            Image("header_image")
                //                .resizable()
                //                .aspectRatio(contentMode: .fit)
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
            }.alert(isPresented: $viewModel.showError, content: {
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
            AuthView().environmentObject(AuthService(dataKeeper: UserDataKeeper(email: "",
                                uid: "")))
        }
    }
