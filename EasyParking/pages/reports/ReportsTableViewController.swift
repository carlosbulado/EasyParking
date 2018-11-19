//
//  ReportsTableViewController.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-18.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import UIKit

class ReportsTableViewController: UITableViewController
{
    var loggedUser : User = User()
    var tickets : [ParkingPaymentReceipt] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ticketServ : IParkingPaymentReceiptService = ParkingPaymentReceiptService()
        
        self.tickets = ticketServ.getAllFromUser(user: self.loggedUser)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.tickets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCellReportsTVId", for: indexPath)
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy/MM/dd HH:mm"
        let date = dateFormatterGet.string(from: self.tickets[indexPath.row].date)

        cell.textLabel?.text = "\(self.tickets[indexPath.row].user.name ?? "") - \(self.tickets[indexPath.row].user.carCompany ?? "")/\(self.tickets[indexPath.row].user.carColor ?? "") - \(date)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = sb.instantiateViewController(withIdentifier: "reportVC") as! ReportViewController
        mainVC.loggedUser = self.loggedUser
        mainVC.ticket = self.tickets[indexPath.row]
        mainVC.type = false
        self.navigationController?.pushViewController(mainVC, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
