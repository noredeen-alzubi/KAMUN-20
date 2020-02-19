//
//  Article.swift
//  KAMUN 20
//
//  Created by Noredeen AL-Zu'bi on 2/15/20.
//  Copyright © 2020 Bashar Al-Zu'bi. All rights reserved.
//

import Foundation
import UIKit

class Article {
    
    var title: String
    var author: String
    var text: String
    let id: String
    var time: String
    var imageURL: String
    var image = imageWithProp()
    
    init(dictionary : [String:AnyObject], id: String){
        self.title = dictionary["title"] as! String
        self.author = dictionary["author"] as! String
        self.text = dictionary["text"] as! String
        self.imageURL = dictionary["image"] as! String
        self.id = id
        self.time = dictionary["time"] as! String
        
        
        /*
         let imageURL = URL(string: self.imageURL)
         URLSession.shared.dataTask(with: imageURL!) { (data, response, error) in
            if error != nil{
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
            
            }.resume()
        */
    }
    
    init(title: String, author: String, text: String, image: UIImage) {
        self.title = title
        self.author = author
        self.image.image = image
        self.text = text
        self.id = ""
        self.imageURL = ""
        self.time = ""
    }
}

struct imageWithProp{
    
    var image: UIImage
    var exists: Bool
    
    init() {
        image = UIImage(named: "ip")!
        exists = false
    }
    

}
