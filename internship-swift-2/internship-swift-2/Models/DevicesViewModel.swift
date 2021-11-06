//
//  DevicesViewModel.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 06.11.2021.
//

import Foundation


class DevicesViewModel: ObservableObject {
    
    @Published var devices = [Device]()
}
