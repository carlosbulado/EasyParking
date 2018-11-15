//
//  IUserRepository.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-10-31.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

protocol IUserRepository : IRepositoryBase
{
    func SaveUser(user : User) throws -> User
    func Login(_ login : String?, _ password: String?) throws -> User
}
