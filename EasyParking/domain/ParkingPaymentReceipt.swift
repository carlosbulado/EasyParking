//
//  ParkingPaymentReceipt.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-14.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class ParkingPaymentReceipt : Entity
{
    var user : User
    var hoursParked : Double
    var date : Date
    var lotNumber : Int
    var SpotNumber : Int
    var PaymentMethod : Int
    var PaymentAmount : Double
    
    override init()
    {
        self.user = User()
        self.hoursParked = 0
        self.date = Date()
        self.lotNumber = 0
        self.SpotNumber = 0
        self.PaymentMethod = 0
        self.PaymentAmount = 0
        super.init()
    }
    
    static func parse(_ newUser : Dictionary<String, AnyObject>) -> ParkingPaymentReceipt
    {
        let obj = ParkingPaymentReceipt()
        for (k, v) in newUser
        {
            var value : String = ""
            if k != "User"
            {
                value = v as! String
            }
            
            switch k
            {
            case "hoursParked":
                obj.hoursParked = Double(value)!
            case "date":
                obj.date = Date(timeIntervalSince1970: TimeInterval(value)!)
            case "lotNumber":
                obj.lotNumber = Int(value)!
            case "SpotNumber":
                obj.SpotNumber = Int(value)!
            case "PaymentMethod":
                obj.PaymentMethod = Int(value)!
            case "PaymentAmount":
                obj.PaymentAmount = Double(value)!
            case "User":
                obj.user = v as! User
            default: break
            }
        }
        return obj
    }
}
