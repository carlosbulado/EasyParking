//
//  User.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-10-31.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class User : Entity
{
    var name : String?
    var login : String?
    var password : String?
    var contactNumber : String?
    var plateNumber : String?
    var email : String?
    var carCompany : String?
    var carColor : String?
    
    override init()
    {
        super.init()
    }
    
    init(_ id : Int, _ name : String, _ login : String, _ pass : String, _ contact : String, _ plate : String)
    {
        super.init(id)
        self.name = name
        self.login = login
        self.password = pass
        self.contactNumber = contact
        self.plateNumber = plate
    }
    
    init(_ id : Int, _ name : String, _ login : String, _ pass : String, _ contact : String, _ plate : String, _ email : String, _ carCompany : String, _ carColor : String)
    {
        super.init(id)
        self.name = name
        self.login = login
        self.password = pass
        self.contactNumber = contact
        self.plateNumber = plate
        self.email = email
        self.carCompany = carCompany
        self.carColor = carColor
    }
    
    static func parse(_ newUser : Dictionary<String, AnyObject>) -> User
    {
        let user = User()
        for (k, v) in newUser
        {
            let value : String = v as! String
            switch k
            {
            case "name":
                user.name = value
            case "id":
                user.id = Int(value)!
            case "login":
                user.login = value
            case "password":
                user.password = value
            case "contactNumber":
                user.contactNumber = value
            case "plateNumber":
                user.plateNumber = value
            case "email":
                user.email = value
            case "carCompany":
                user.carCompany = value
            case "carColor":
                user.carColor = value
            default: break
            }
        }
        return user
    }
    
    func unParse() -> Dictionary<String, AnyObject>
    {
        let dict : [String : AnyObject] =
        [
            "id" : self.id as AnyObject,
            "name" : self.name as AnyObject,
            "login" : self.login as AnyObject,
            "password" : self.password as AnyObject,
            "contactNumber" : self.contactNumber as AnyObject,
            "plateNumber" : self.plateNumber as AnyObject,
            "email" : self.email as AnyObject,
            "carCompany" : self.carCompany as AnyObject,
            "carColor" : self.carColor as AnyObject
        ]
        return dict
        
    }
}
