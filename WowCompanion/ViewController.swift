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
    internal var Realmlist = RealmListing.init()
    internal var token = AuthToken.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get our token data
        GETToken(credentials: credentials)
        // Wait until our token is properly created
        while token.token == "0" {
        }
        print(token.token)
        
        // Time to load our realmlists
        GETRealmlists(token: token)
        while Realmlist.GetRealmListStatus() != true{
            
        }
        // Update our search page with the proper data
        let secondTab = self.tabBarController?.viewControllers![1] as! SearchViewController
        secondTab.realmList = Realmlist
        secondTab.token = token
        
        
    }

}

