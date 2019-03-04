//
//  SearchResult.swift
//  WowCompanion
//
//  Created by Joseph Storer on 3/2/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import Foundation
import UIKit
class SearchResult{
    var name: String
    var realm: String
    var Class: Int
    var level: Int
    var faction: Int
    var thumbnail: String
    var avatarIcon: UIImage!
    public func GetName() -> String{
        return name
    }
    public func GetRealm() -> String{
        return realm
    }
    
    public func GetDetails() -> String{
        let helper = ArmoryHelper()
        return "\(level) \(helper.GETClassByID(i: Class))"
    }
    
    public func GetAvatarPath() -> String{
        return thumbnail;
    }
    public func GetAvatar() -> UIImage?{
        if avatarIcon != nil{
            return avatarIcon
        }else{
            return nil
        }
    }
    init(name:String,realm:String,Class:Int,level:Int,faction:Int,thumbnail:String) {
        self.name = name
        self.realm = realm
        self.Class = Class
        self.level = level
        self.faction = faction
        self.thumbnail = "http://render-us.worldofwarcraft.com/character/" + thumbnail
        if let url = URL(string: self.thumbnail){
            do{
                let data = try Data(contentsOf: url)
                self.avatarIcon = UIImage(data: data)
                print("image loaded")
            }
            catch{
                print(error.localizedDescription)
            }
        }

    }
}

