//
//  IServiceBase.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-02.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

protocol IServiceBase
{
    func getRepository() -> IRepositoryBase
    func save<T : Entity>(obj : T) throws -> Bool
}
