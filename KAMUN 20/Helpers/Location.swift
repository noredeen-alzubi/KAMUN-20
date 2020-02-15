//
//  Location.swift
//  KAMUN 20
//
//  Created by Noredeen Al-Zu'bi on 2/15/2020.
//  Copyright © 2020 Noredeen AL-Zu'bi. All rights reserved.
//

import Foundation

class Location{
    
    var building: String
    var room: String
    var forum: String
    
    init(forum: String, dictionary : [String:AnyObject]){
        self.forum = forum
        self.room = dictionary["room"] as! String
        self.building = dictionary["building"] as! String
    }
    
}
