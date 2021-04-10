//
//  ChatRoom.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/04/04.
//

import Foundation
import Firebase

class ChatRoom {

    let latestMessageId: String?
    let members: [String]?
    let createdAt: Timestamp
    
    var documentId: String?
    var partnerUser: User?
    
    
    init(dic: [String: Any]) {
        self.latestMessageId = dic["latestMessageId"] as? String ?? ""
        self.members = dic["members"] as? [String] ?? [String]()
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
    }
}
