//
//  User.swift
//  Hotfix
//
//  Created by Владислав on 30.10.22.
//

import Foundation
import Firebase

struct User {
    
    let uid: String
    let phone: String
    
    init(user: Firebase.User) {
        self.uid = user.uid
        self.phone = user.providerID
    }
}
