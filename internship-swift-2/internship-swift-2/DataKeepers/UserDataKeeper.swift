//
//  UserDataKeeper.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 29.10.2021.
//

import Foundation

struct UserDataKeeper {
    var email: String = ""
    var uid: String = ""
    
    mutating func clear(){
        email = ""
        uid = ""
    }
    
    mutating func create(user: UserDataKeeper){
        email = user.email
        uid = user.uid
    }
}
