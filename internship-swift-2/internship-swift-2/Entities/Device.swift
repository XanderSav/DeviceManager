//
//  Device.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 06.11.2021.
//

import Foundation

struct Device: Identifiable, Codable {
    var id: String? {
        get {
            return UDID
        }
    }
    
    var UDID: String?
    var displayName: String?
    var usedBy: String?
}
