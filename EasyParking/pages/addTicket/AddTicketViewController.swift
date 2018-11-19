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
    var ticket : ParkingPaymentReceipt = ParkingPaymentReceipt()
    
    @IBOutlet weak var lotNumber: UITextField!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userPlateNumber: UILabel!
    @IBOutlet weak var userCarCompany: UILabel!
    @IBOutlet weak var userCarColor: UILabel!
    @IBOutlet weak var date: UIDatePicker!
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
            self.amountToPay.text = "$ 5,00"
            self.ticket.PaymentAmount = Double(5)
            
            self.ticket.user = self.loggedUser
        }
        else
        {
            AlertUtil.OkAlert(self, "Error - Add ticket", "User not logged!")
            { () -> () in
                self.dismiss(animated: true, completion: nil)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onValueChanged(_ sender: UISegmentedControl)
    {
        print("\(self.ticket.hoursParked)")
        self.ticket.hoursParked = Double(sender.selectedSegmentIndex)
        print("\(self.ticket.hoursParked)")
        
        switch sender.selectedSegmentIndex
        {
        case 1:
            self.amountToPay.text = "$ 8,00"
            self.ticket.PaymentAmount = Double(8)
        case 2:
            self.amountToPay.text = "$ 11,00"
            self.ticket.PaymentAmount = Double(11)
        case 3:
            self.amountToPay.text = "$ 13,00"
            self.ticket.PaymentAmount = Double(13)
        case 4:
            self.amountToPay.text = "$ 15,00"
            self.ticket.PaymentAmount = Double(15)
        default:
            self.amountToPay.text = "$ 5,00"
            self.ticket.PaymentAmount = Double(5)
        }
    }
    
    @IBAction func onChangeLot(_ sender: UITextField)
    {
        if let val = Int(sender.text!)
        {
            self.ticket.lotNumber = val
        }
        else
        {
            sender.text = ""
        }
        print("changed")
    }
    
    @IBAction func onChangeDate(_ sender: UIDatePicker)
    {
        self.ticket.date = sender.date
        print("changed")
    }
    
    @IBAction func onChangeSpot(_ sender: UITextField)
    {
        if let val = Int(sender.text!)
        {
            self.ticket.SpotNumber = val
        }
        else
        {
            sender.text = ""
        }
        print("changed")
    }
    
    @IBAction func onChangePayMet(_ sender: UISegmentedControl)
    {
        print("\(self.ticket.PaymentMethod)")
        self.ticket.PaymentMethod = sender.selectedSegmentIndex
        print("\(self.ticket.PaymentMethod)")
    }
    
    @IBAction func onChangePaymentMethod(_ sender: UISegmentedControl)
    {
        print("\(self.ticket.PaymentMethod)")
        self.ticket.PaymentMethod = sender.selectedSegmentIndex
        print("\(self.ticket.PaymentMethod)")
    }
    
    @IBAction func saveTicket(_ sender: UIBarButtonItem)
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = sb.instantiateViewController(withIdentifier: "reportVC") as! ReportViewController
        mainVC.loggedUser = self.loggedUser
        mainVC.ticket = self.ticket
        self.navigationController?.pushViewController(mainVC, animated: true)
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
