//
//  UserRepository.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-10-31.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class UserRepository : RepositoryBase, IUserRepository
{
    static let INSERT_INTO : String = "INSERT INTO User (name, login, password, contactNumber, plateNumber, email, carCompany, carColor) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
    static let UPDATE : String = "UPDATE User set name = ?, login = ?, password = ?, contactNumber = ?, plateNumber = ?, email = ?, carCompany = ?, carColor = ? WHERE id = ?"
    
    func SaveUser(user: User) throws -> User {
        return SoftwareEmbeddedDatabase.SaveUser(user)
    }
    
    func Login(_ login: String?, _ password: String?) throws -> User {
        var user : User = User()
        
        let sql = "select * from User where login = ? and password = ?"
        let results = Database.select(sql, [login as Any, password as Any])
        
        if results.count > 0
        {
            user = User.parse(results[0] as Dictionary<String, AnyObject>)
        }
        
        return user
    }
    
    override func save<T>(_ obj: T) throws -> Bool where T : Entity {
        let reg : User = obj as! User
        if reg.id > 0
        {
            return Database.save(UserRepository.UPDATE, [
                reg.name as Any,
                reg.login as Any,
                reg.password as Any,
                reg.contactNumber as Any,
                reg.plateNumber as Any,
                reg.email as Any,
                reg.carCompany as Any,
                reg.carColor as Any,
                reg.id as Any,
                ])
        }
        return Database.save(UserRepository.INSERT_INTO, [
            reg.name as Any,
            reg.login as Any,
            reg.password as Any,
            reg.contactNumber as Any,
            reg.plateNumber as Any,
            reg.email as Any,
            reg.carCompany as Any,
            reg.carColor as Any
            ])
    }
}
