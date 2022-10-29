//
//  User.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 03.10.2022.
//

import Foundation


class User {
    
    var imputDictionary = Dictionary<String, AnyObject>()
    
    convenience init(imputDictionary: Dictionary<String, AnyObject>) {
        self.init()
        self.imputDictionary = imputDictionary
    }
    
    var name: String {
        set(newName) {
            imputDictionary["name"] = newName as AnyObject
        }
        get {
            return (imputDictionary["name"] as? String)!
        }
    }
    
    var password: String {
        set(newName) {
            imputDictionary["password"] = newName as AnyObject
        }
        get {
            return (imputDictionary["password"] as? String)!
        }
    }
}
