//
//  RealmListing.swift
//  WowCompanion
//
//  Created by Joseph Storer on 3/1/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import Foundation


class RealmListing{
    private var loaded = false;
    private var RealmList = [Realm]()
    public func AddRealm(realm: Realm){
        RealmList.append(realm)
    }
    public func GetRealmsCount() -> Int{
        return RealmList.count
    }
    public func FinalizeRealmLoad(){
        loaded = true
    }
    public func GetRealmListStatus() -> Bool{
        return loaded
    }
    
    public func GetRealmAt(i: Int) -> Realm?{
        //TODO:: Checkif this works
        if i <= (RealmList.count - 1) && i >= 0 && RealmList.count > 0{
            let realm: Realm = RealmList[i]
            return realm
        }else{
            return nil
        }
    }
    
    public func GetLocaleByRealm(_realm: String) -> String?{
        if GetRealmsCount() > 0 {
            for realm in RealmList{
                if realm.GetName() == _realm{
                    return realm.GetLocale()
                }
            }
        }
        return nil
    }
    
    
    init() {
        // initalized.
    }
    
}

public class Realm{
    private var type: String
    private var pop: String
    private var queue: Bool
    private var status: Bool
    private var name: String
    private var slug: String
    private var battlegroup: String
    private var locale: String
    private var timezone: String
    
    public func GetName() -> String{
        return name
    }
    public func GetLocale() -> String{
        return locale
    }
    
    
    init(type: String, pop: String, queue: Bool, status: Bool,name: String, slug: String, battlegroup: String,locale: String,timezone:String) {
        self.type = type
        self.pop = pop
        self.queue = queue
        self.status = status
        self.name = name
        self.slug = slug
        self.battlegroup = battlegroup
        self.locale = locale
        self.timezone = timezone
    }
}
