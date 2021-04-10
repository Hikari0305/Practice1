//
//  User.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/04/02.
//

import UIKit
import FirebaseFirestore

class User {

    let email: String
    let username: String
    let createdAt: Timestamp
    let profileImageImageUrl: String
    
    var uid: String?
    
    init(dic: [String: Any]) {
        self.email = dic["email"] as? String ?? ""
        self.username = dic["username"] as? String ?? ""
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
        self.profileImageImageUrl = dic["profileImageUrl"] as? String ?? ""
    }
    
}
