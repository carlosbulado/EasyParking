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
    var PaymentMethod : String
    var PaymentAmount : Double
    
    override init()
    {
        self.user = User()
        self.hoursParked = 0
        self.date = Date()
        self.lotNumber = 0
        self.SpotNumber = 0
        self.PaymentMethod = String()
        self.PaymentAmount = 0
        super.init()
    }
    /*
     Parking payment receipt should accept following information from the user
     - User Email Address
     - Car plate number
     - Car Company [upon selection of company appropriate logo should be
     displayed]
     - Car color
     - No. of hours parked
     - Date and Time
     - Lot number
     - Spot number
     - Payment method
     - Payment amount
     After entering all information, it should be displayed in proper format in
     next screen. You may also generate pdf contain all information in proper
     format.
 */
}
