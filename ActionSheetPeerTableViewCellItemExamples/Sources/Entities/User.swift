//
//  User.swift
//  ActionSheetPeerTableViewCellItemExamples
//
//  Created by Pavle Ralic on 2/27/20.
//  Copyright © 2020 Pavle Ralic. All rights reserved.
//

import RealmSwift
import UIKit.UIImage

class User: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String? = nil
    @objc dynamic var lastName: String? = nil
    
    var profilePictureSmallImage: UIImage {
        return UIImage(named: "user\(id)")!
    }
    
    var fullname: String {
        return "\(name ?? "") \(lastName ?? "")"
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: Int, name: String, lastName: String) {
        self.init()
        self.id = id
        self.name = name
        self.lastName = lastName
    }
}
