//
//  DOS.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/23/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import Foundation

class DOS{
    var name: String
    var forum: String
    let id: String
    var imageURL: String
    var image = imageWithProp()
    
    init(dictionary : [String:AnyObject], id: String) {
        self.id = id
        self.name = dictionary["name"] as! String
        self.forum = dictionary["forum"] as! String
        self.imageURL = dictionary["image"] as! String
    }
    
    struct imageWithProp{
        
        var image: UIImage
        var exists: Bool
        
        init() {
            image = UIImage(named: "ip")!
            exists = false
        }
        

    }
}
