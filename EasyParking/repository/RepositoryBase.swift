//
//  RepositoryBase.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-02.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class RepositoryBase : IRepositoryBase
{
    static var USE_DATABASE : Bool = false;
    
    func save<T>(_ obj: T) throws -> Bool where T : Entity
    {
        /*
        if(RepositoryBase.USE_DATABASE)
        {
            
        }
        else
        {
            if(obj is User)
            {
                let newUser = SoftwareEmbeddedDatabase.SaveUser(obj as! User)
                return newUser.id != 0 ? true : false
            }
        }
        return true;
         */
        return false;
    }
    
}
