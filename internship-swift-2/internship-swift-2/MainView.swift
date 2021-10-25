//
//  MainView.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 24.10.2021.
//

import SwiftUI
import GoogleSignIn

struct MainView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject private var devicesVm = DeviceViewModel()
    
    private let user = GIDSignIn.sharedInstance().currentUser
    
    var body: some View {
        NavigationView {
            List(devicesVm.devices) { device in
                VStack(alignment: .leading) {
                    Text(device.displayName ?? "").font(.title)
                    Text(device.UDID ?? "").font(.title)
                    if (device.usedBy != nil && device.usedBy != "") {
                        Text(device.usedBy!).font(.title)
                    }
                    else {
                        Text("Free to use").font(.title)
                    }
                }.navigationTitle("DeviceManager")
            }
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

/// A generic view that is helpful for showing images from the network.
struct NetworkImage: View {
    let url: URL?
    
    var body: some View {
        if let url = url,
           let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
