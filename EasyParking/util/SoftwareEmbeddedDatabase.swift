//
//  SoftwareEmbeddedDatabase.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-02.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation
import SQLite3

class SoftwareEmbeddedDatabase
{
    static var users : [User] =
    [
        User(1, "Adm", "admin", "123", "416 543 4900", "HYG 778")
    ]
    
    static func SaveUser(_ user : User) -> User
    {
        let us = UserAlreadyExists(user)
        if us.id == 0
        {
            user.id = users.count + 1
            users.append(user)
            return user
        }
        us.login = user.login
        us.name = user.name
        us.password = user.password
        us.contactNumber = user.contactNumber
        us.plateNumber = user.plateNumber
        return us
    }
    
    static func UserAlreadyExists(_ user : User) -> User
    {
        for us in users
        {
            if us.login == user.login || us.id == user.id
            {
                return us
            }
        }
        return user
    }
    
    static func UserLogin(_ login : String?, _ password : String?) -> User
    {
        for us in users
        {
            if us.login == login && us.password == password
            {
                return us
            }
        }
        return User()
    }
}
