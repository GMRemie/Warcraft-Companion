//
//  AuthToken.swift
//  WowCompanion
//
//  Created by Joseph Storer on 2/27/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import Foundation


class AuthToken {
    var token: String
    let type: String
    let expire: Int

    
    init() {
        self.token = "0"
        self.type = "0"
        self.expire = 0
    }
    
    init(token: String, type: String, expire: Int) {
       
        self.token = token
        self.type = type
        self.expire = expire
    }

}
