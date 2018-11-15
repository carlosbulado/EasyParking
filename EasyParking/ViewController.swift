//
//  ViewController.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-10-30.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Database.init()
        /*
        let user = SettingsUtil.getLoggedUser()
        if user.id > 0
        {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let mainVC = sb.instantiateViewController(withIdentifier: "mainMenuVC") as! MainMenuTableViewController
            navigationController?.pushViewController(mainVC, animated: true)
        }
        */
    }
    
    @IBAction func goToSignUp(_ sender: UIButton) {
        
    }
    
}

