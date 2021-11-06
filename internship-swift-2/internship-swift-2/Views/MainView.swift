//
//  MainView.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 06.11.2021.
//

import SwiftUI

struct MainView: View {
    @StateObject private var devicesVm = DevicesViewModel()
    @EnvironmentObject var authService: AuthenticationService
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
