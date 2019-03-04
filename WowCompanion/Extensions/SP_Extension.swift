//
//  SP_Extension.swift
//  WowCompanion
//
//  Created by Joseph Storer on 3/2/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import Foundation

extension SearchViewController{
    
    
    
    internal func GETPlayers(name:String, realms:RealmListing,token:AuthToken){
        searchResults.removeAll()
        searchCalls = 0
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        for realm in 0...realms.GetRealmsCount() - 1 {
            let checkRealm:Realm = realms.GetRealmAt(i: realm)!
            let realmName: String = checkRealm.GetName()
            let locale: String = checkRealm.GetLocale()
            
            
            if let validURL = URL(string: "https://us.api.blizzard.com/wow/character/" + realmName + "/" + name + "?locale=" + locale + "&access_token=" + token.token){
                
                let task = session.dataTask(with: validURL) { (data, response, error) in
                    if let error = error{
                        print("Data task failed with error \(error.localizedDescription)")
                        return
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse,
                        httpResponse.statusCode == 200,
                        let validData = data
                        else{ self.searchCalls = self.searchCalls + 1;return}
                    
                    do{
                        self.searchCalls = self.searchCalls + 1
                        // run the parseJSONData method
                        let jsonObj = try JSONSerialization.jsonObject(with: validData, options: .mutableContainers) as? [String: Any]
                        print(self.searchCalls)
                            parseJsonResults(jsonObj: jsonObj,final: false)
                        
                        
                        //print("JSON token created successfully")
                    }
                    catch{
                        print("Error creating json object! \(error.localizedDescription)")
                    }
                }
                task.resume()
            }
        }
    
    
        func parseJsonResults(jsonObj: [String:Any]?, final: Bool){
            guard let jsonData = jsonObj
                else{print("Failed to unwrap JSON object"); return}
            let name = jsonData["name"] as! String
            let realm = jsonData["realm"] as! String
            let Class = jsonData["class"] as! Int
            let level = jsonData["level"] as! Int
            let thumbnail = jsonData["thumbnail"] as! String
            let faction = jsonData["faction"] as! Int
            searchResults.append(SearchResult.init(name: name, realm: realm, Class: Class, level: level, faction: faction, thumbnail: thumbnail))
            
            // TODO:: FIX THIS SOME HOW FUCK
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
