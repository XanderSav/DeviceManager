//
//  ContentView.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 22.10.2021.
//

import SwiftUI

struct AuthView: View {@EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
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
        }
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
        AuthView()
    }
}
