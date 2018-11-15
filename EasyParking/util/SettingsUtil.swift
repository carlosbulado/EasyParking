//
//  SettingsUtil.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-07.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class SettingsUtil
{
    static let path = Bundle.main.path(forResource: "Settings", ofType: "plist")
    static var contents = NSDictionary(contentsOfFile: path!) as! [String : AnyObject]
    
    static func getLoggedUser() -> User
    {
        if let userSettings = contents["User"]
        {
            let user = User.parse(userSettings as! Dictionary<String, AnyObject>)
            return user
        }
        return User()
    }
    
    static func saveSettings(user : User)
    {
        contents["User"] = user.unParse() as AnyObject
        let newDic = NSDictionary(dictionary: SettingsUtil.contents)
        newDic.write(toFile: SettingsUtil.path!, atomically: true)
    }
}
