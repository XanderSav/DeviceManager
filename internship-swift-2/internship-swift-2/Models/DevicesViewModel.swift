//
//  DevicesViewModel.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 06.11.2021.
//

import Foundation
import FirebaseFirestore


class DevicesViewModel: ObservableObject {
    
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
}
