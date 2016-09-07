//
//  Friend.swift
//  Friends
//
//  Created by Abraham Isaac Durán on 9/7/16.
//  Copyright © 2016 Abraham Durán. All rights reserved.
//

import Foundation

class Friend {
    var id: Int
    var name: String
    var profilePicturePath: String?
    var isFriend: Bool?
    
    init(id: Int, name: String, profilePicturePath: String, isFriend: Bool){
        self.id = id
        self.name = name
        self.profilePicturePath = profilePicturePath
        self.isFriend = isFriend
    }
    
    convenience init(){
        self.init(id: 0, name: "", profilePicturePath: "default.png", isFriend: false)
    }
    
    convenience init(id: Int, name: String){
        self.init(id: id, name: name, profilePicturePath: "default.png", isFriend: false)
    }
    
    convenience init(id: Int, name: String, profilePicturePath: String){
        self.init(id: id, name: name, profilePicturePath: profilePicturePath, isFriend: false)
    }
    
    convenience init(id: Int, name: String, isFriend: Bool){
        self.init(id: id, name: name, profilePicturePath: "default.png", isFriend: isFriend)
    }
}
