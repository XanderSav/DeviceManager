//
//  PhoneModel.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 25.10.2021.
//

import Foundation

struct Device: Codable, Identifiable {
    
    var id: String? {
        get {
            return UDID
        }
    }
    
    var UDID: String?
    var displayName: String?
    var usedBy: String?
}
