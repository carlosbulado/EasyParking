//
//  AlertUtil.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-05.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation
import UIKit

class AlertUtil
{
    static func OkAlert(_ vc : UIViewController, _ title : String?, _ message : String?, _ callbackParam : @escaping () -> () = { })
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            callbackParam()
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: callActionHandler))
        
        vc.present(alert, animated: true)
    }
}
