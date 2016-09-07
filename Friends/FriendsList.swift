//
//  File.swift
//  Friends
//
//  Created by Abraham Isaac Durán on 9/7/16.
//  Copyright © 2016 Abraham Durán. All rights reserved.
//

import Foundation

class FriendsList {
    var source: String
    var friends: [Friend]
    
    init(source: String, friends: [Friend]){
        self.source = source
        self.friends = friends
    }
    
    convenience init(){
        self.init(source: "", friends: [Friend]())
    }
}