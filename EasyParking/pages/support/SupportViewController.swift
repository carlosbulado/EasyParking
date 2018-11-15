//
//  SupportViewController.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-06.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import UIKit

class SupportViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onEmailClick(_ sender: UIButton) {
        let email = "support@easyparking.com"
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBAction func onPhoneClick(_ sender: UIButton) {
        let number = 4168766842
        if let url = URL(string: "tel://\(number)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
