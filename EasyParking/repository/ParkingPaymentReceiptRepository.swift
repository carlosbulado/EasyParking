//
//  ParkingPaymentReceiptRepository.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-14.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class ParkingPaymentReceiptRepository : RepositoryBase, IParkingPaymentReceiptRepository
{
    func getAllFromUser(user: User) -> [ParkingPaymentReceipt] {
        let sql = "select * from ParkingPaymentReceipt where userId = ?"
        let results = Database.select(sql, [user.id as Any])
        var retn : [ParkingPaymentReceipt] = []
        
        if results.count > 0
        {
            for i in 0...results.count - 1
            {
                var dic = results[i] as Dictionary<String, AnyObject>
                dic["User"] = user
                retn.append(ParkingPaymentReceipt.parse(dic))
            }
        }
        
        return retn
    }
    
    static let INSERT_INTO : String = "INSERT INTO ParkingPaymentReceipt (userId, hoursParked, date, lotNumber, SpotNumber, PaymentMethod, PaymentAmount) VALUES (?, ?, ?, ?, ?, ?, ?)"
    static let UPDATE : String = "UPDATE ParkingPaymentReceipt set userId = ?, hoursParked = ?, date = ?, lotNumber = ?, SpotNumber = ?, PaymentMethod = ?, PaymentAmount = ? WHERE id = ?"
    
    override func save<T>(_ obj: T) throws -> Bool where T : Entity {
        let reg : ParkingPaymentReceipt = obj as! ParkingPaymentReceipt
        if reg.id > 0
        {
            return Database.save(ParkingPaymentReceiptRepository.UPDATE, [
                reg.user.id as Any,
                reg.hoursParked as Any,
                reg.date as Any,
                reg.lotNumber as Any,
                reg.SpotNumber as Any,
                reg.PaymentMethod as Any,
                reg.PaymentAmount as Any,
                reg.id as Any
                ])
        }
        return Database.save(ParkingPaymentReceiptRepository.INSERT_INTO, [
            reg.user.id as Any,
            reg.hoursParked as Any,
            reg.date as Any,
            reg.lotNumber as Any,
            reg.SpotNumber as Any,
            reg.PaymentMethod as Any,
            reg.PaymentAmount as Any
            ])
    }
}
