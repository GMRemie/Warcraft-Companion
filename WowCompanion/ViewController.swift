//
//  ViewController.swift
//  WowCompanion
//
//  Created by Joseph Storer on 2/26/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let credentials = APICredentials.init()
    internal var token = AuthToken.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get our token data
        GETToken(credentials: credentials)
        // Wait until our token is properly created
        while token.token == "0" {
            
        }
        print(token.token)
    }

    

}

