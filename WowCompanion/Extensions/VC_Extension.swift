//
//  VC_Extension.swift
//  WowCompanion
//
//  Created by Joseph Storer on 2/27/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import Foundation

extension ViewController{
    
    internal func GETToken(credentials: APICredentials){
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        if let validURL = URL(string: "https://us.battle.net/oauth/token?grant_type=client_credentials&client_id=" + credentials.CLIENT_ID + "&client_secret=" + credentials.CLIENT_SECRET){
            
            let task = session.dataTask(with: validURL) { (data, response, error) in
                if let error = error{
                    print("Data task failed with error \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200,
                    let validData = data
                    else{print("JSON object failed"); return}
                
                do{
                    // run the parseJSONData method
                    let jsonObj = try JSONSerialization.jsonObject(with: validData, options: .mutableContainers) as? [String: Any]
                    // run the parse json method on the json object
                    
                    self.parseJsonData(jsonObject: jsonObj)
                    
                    print("JSON token created successfully")
                }
                catch{
                    print("Error creating json object! \(error.localizedDescription)")
                }
            }
            task.resume()
        }
        
    }
    func parseJsonData(jsonObject: [String: Any]?){
        guard let jsonData = jsonObject
            else{print("Failed to unwrap JSON object"); return}
     
        let access_token = jsonData["access_token"] as! String
        let bearer = jsonData["token_type"] as! String
        let expire = jsonData["expires_in"] as! Int
        token = AuthToken.init(token: access_token, type: bearer, expire: expire)
     
        
    }
    
    
    
    
    
    
    
    
}
