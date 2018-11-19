//
//  ParkingPaymentReceiptService.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-14.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation

class ParkingPaymentReceiptService : ServiceBase, IParkingPaymentReceiptService
{
    func getAllFromUser(user: User) -> [ParkingPaymentReceipt]
    {
        let rep = self.getRepository() as! ParkingPaymentReceiptRepository
        return rep.getAllFromUser(user: user)
    }
    
    init()
    {
        super.init(ParkingPaymentReceiptRepository())
    }
}
