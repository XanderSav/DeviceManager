//
//  InitialView.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 24.10.2021.
//

import SwiftUI

struct InitialView: View {
    @EnvironmentObject var viewModel: AuthViewModel

      var body: some View {
        switch viewModel.state {
        case .signedIn: MainView()
        case .signedOut: AuthView()
        }
      }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
