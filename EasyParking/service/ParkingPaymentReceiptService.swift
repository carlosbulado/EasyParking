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
    init()
    {
        super.init(ParkingPaymentReceiptRepository())
    }
}
