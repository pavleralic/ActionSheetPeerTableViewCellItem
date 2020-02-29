//
//  Message.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import RealmSwift

class Message: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var comment: String? = nil
    @objc dynamic var pubDate: Int = 0
    @objc dynamic weak var user: User? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: Int, comment: String, pubDate: Int, user: User) {
        self.init()
        
        self.id = id
        self.comment = comment
        self.pubDate = pubDate
        self.user = user
    }
}
