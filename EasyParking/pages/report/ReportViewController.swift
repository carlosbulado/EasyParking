//
//  ReportViewController.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-15.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {

    var ticket : ParkingPaymentReceipt = ParkingPaymentReceipt()
    var type : Bool = true
    var backScreen : ViewController = ViewController()
    var loggedUser : User = User()
    @IBOutlet weak var btnClose: UIBarButtonItem!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var plate: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var lot: UILabel!
    @IBOutlet weak var spot: UILabel!
    @IBOutlet weak var payment: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.btnClose.title = self.type ? "Save" : "Exit"
        
        self.user.text = self.ticket.user.name
        self.email.text = self.ticket.user.email
        self.plate.text = self.ticket.user.plateNumber
        self.company.text = self.ticket.user.carCompany
        self.color.text = self.ticket.user.carColor
        switch self.ticket.hoursParked
        {
        case 1:
            self.hours.text = "2-4 Hours"
        case 2:
            self.hours.text = "4-6 Hours"
        case 3:
            self.hours.text = "6-8 Hours"
        case 4:
            self.hours.text = "8+ Hours"
        default:
            self.hours.text = "1 Hour"
        }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm"
        self.date.text = dateFormatterGet.string(from: self.ticket.date)
        self.lot.text = "\(self.ticket.lotNumber)"
        self.spot.text = "\(self.ticket.SpotNumber)"
        switch self.ticket.PaymentMethod
        {
        case 0:
            self.payment.text = "Cash"
        case 1:
            self.payment.text = "Debit"
        default:
            self.payment.text = "Credit"
        }
        self.amount.text = "\(self.ticket.PaymentAmount)"
    }

    @IBAction func onClickBtnClose(_ sender: UIBarButtonItem)
    {
        if self.type
        {
            let ticketServ : IParkingPaymentReceiptService = ParkingPaymentReceiptService()
            
            do
            {
                let saved = try ticketServ.save(obj: self.ticket)
                if saved
                {
                    AlertUtil.OkAlert(self, "Add ticket", "Ticket successfully registred!")
                    { () -> () in
                        let sb = UIStoryboard(name: "Main", bundle: nil)
                        let mainVC = sb.instantiateViewController(withIdentifier: "mainMenuVC") as! MainMenuTableViewController
                        mainVC.loggedUser = self.loggedUser
                        self.navigationController?.pushViewController(mainVC, animated: true)
                    }
                }
                else
                {
                    AlertUtil.OkAlert(self, "Add ticket", "Ticket not registred!")
                }
            }
            catch
            {
                AlertUtil.OkAlert(self, "Add ticket", "Ticket not registred!")
            }
        }
        else
        {
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
