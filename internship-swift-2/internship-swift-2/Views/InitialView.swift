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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
