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
        
        NavigationView {
            List(devicesVm.devices) { device in
                VStack(alignment: .leading) {
                    Text(device.displayName ?? "").font(.title)
                    Text(device.UDID ?? "").font(.footnote)
                    if (device.usedBy != nil && device.usedBy != "") {
                        Text(device.usedBy!).font(.body)
                    }
                    else {
                        Text("Free to use").font(.body)
                    }
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
            }.navigationTitle("DeviceManager")
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                .padding(.top)
                .onAppear() {
                    self.devicesVm.fetchData()
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
