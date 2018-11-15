//
//  UserService.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-10-31.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class UserService : ServiceBase, IUserService
{
    func Login(_ login : String?, _ password : String?) throws -> User {
        return try (self.repository as! IUserRepository).Login(login, password)
    }
    
    init()
    {
        super.init(UserRepository())
    }
    
    //func SaveUser(user: User) throws -> Bool {
    //    return try (self.repository as! UserRepository).SaveUser(user: user)
    //}
    
    
}
