//
//  DeviceViewModel.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 25.10.2021.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class DeviceViewModel: ObservableObject {
    
    @Published var devices = [Device]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("devices").addSnapshotListener { (querySnapshot, error) in
            if (error != nil)
            {
                print(error?.localizedDescription)
            }
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
    
    func updateDeviceData(device: Device, user: UserDataKeeper) {
        let devicesRef = db.collection("devices")
        devicesRef.whereField("UDID", isEqualTo: device.UDID!).getDocuments(completion: { querySnapshot, err in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if (querySnapshot!.documents.count == 1) {
                    let docRef = devicesRef.document(querySnapshot!.documents[0].documentID)
                    let data = device.usedBy == user.email ? "" : user.email
                    docRef.updateData(["usedBy": data]) {
                        err in
                        if let err = err {
                            print("error on attempt to update field: \(err)")
                        }
                    }
                }
                else {
                    print("No documents found by DeviceID or multiple documents found")
                }
            }
        })
    }
}
