//
//  Friend.swift
//  Friends
//
//  Created by Abraham Isaac Durán on 9/7/16.
//  Copyright © 2016 Abraham Durán. All rights reserved.
//

import Foundation

class Friend {
    var name: String
    var profilePicturePath: String?
    var isFriend: Bool?
    
    init(name: String, profilePicturePath: String, isFriend: Bool){
        self.name = name
        self.profilePicturePath = profilePicturePath
        self.isFriend = isFriend
    }
    
    convenience init(){
        self.init(name: "", profilePicturePath: "default.png", isFriend: false)
    }
    
    convenience init(name: String){
        self.init(name: name, profilePicturePath: "default.png", isFriend: false)
    }
    
    convenience init(name: String, profilePicturePath: String){
        self.init(name: name, profilePicturePath: profilePicturePath, isFriend: false)
    }
    
    convenience init(name: String, isFriend: Bool){
        self.init(name: name, profilePicturePath: "default.png", isFriend: isFriend)
    }
}
