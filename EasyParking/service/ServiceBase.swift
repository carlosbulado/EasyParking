//
//  ServiceBase.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-02.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class ServiceBase : IServiceBase
{
    func save<T>(obj: T) throws -> Bool where T : Entity {
        return try self.repository.save(obj)
    }
    
    var repository : IRepositoryBase
    
    init(_ repo : IRepositoryBase)
    {
        self.repository = repo
    }
    
    func getRepository() -> IRepositoryBase {
        return self.repository
    }
}
