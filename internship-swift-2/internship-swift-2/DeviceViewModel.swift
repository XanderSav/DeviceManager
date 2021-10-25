//
//  DeviceViewModel.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 25.10.2021.
//

import Foundation
import FirebaseFirestore

class DeviceViewModel: ObservableObject {
    
    @Published var devices = [Device]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("devices").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.devices = documents.map { (queryDocumentSnapshot) -> Device in
                let data = queryDocumentSnapshot.data()
                let UDID = data["UDID"] as? String ?? ""
                let displayName = data["displayName"] as? String ?? ""
                let usedBy = data["usedBy"] as? String ?? ""
                return Device(UDID: UDID, displayName: displayName, usedBy: usedBy)
            }
        }
    }
}
