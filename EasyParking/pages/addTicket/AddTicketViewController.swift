//
//  AddTicketViewController.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-14.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import UIKit

class AddTicketViewController: UIViewController {

    var loggedUser : User = User()
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userPlateNumber: UILabel!
    @IBOutlet weak var userCarCompany: UILabel!
    @IBOutlet weak var userCarColor: UILabel!
    @IBOutlet weak var hours: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var lotNumber: UITextField!
    @IBOutlet weak var spotNumber: UITextField!
    @IBOutlet weak var paymentMethod: UISegmentedControl!
    @IBOutlet weak var amountToPay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if loggedUser.id > 0
        {
            self.userName.text = loggedUser.name ?? ""
            self.userEmail.text = loggedUser.email ?? ""
            self.userPlateNumber.text = loggedUser.plateNumber ?? ""
            self.userCarCompany.text = loggedUser.carCompany ?? ""
            self.userCarColor.text = loggedUser.carColor ?? ""
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTicket(_ sender: UIBarButtonItem)
    {
        
        
        AlertUtil.OkAlert(self, "Add ticket", "Ticket successfully registred!")
        { () -> () in
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let mainVC = sb.instantiateViewController(withIdentifier: "mainMenuVC") as! MainMenuTableViewController
            mainVC.loggedUser = self.loggedUser
            self.navigationController?.pushViewController(mainVC, animated: true)
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
