//
//  MainMenuTableViewController.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-05.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import UIKit

class MainMenuTableViewController: UITableViewController {

    var loggedUser : User = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideBack()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? 2 : 4
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.indexPathForSelectedRow?.section == 0
        {
            switch indexPath.row
            {
            case 0:
                print("Navigate to Add Ticket Page")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = sb.instantiateViewController(withIdentifier: "addTicketVC") as! AddTicketViewController
                mainVC.loggedUser = self.loggedUser
                navigationController?.pushViewController(mainVC, animated: true)
            case 1:
                print("Navigate to Reports Page")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = sb.instantiateViewController(withIdentifier: "reportsTV") as! ReportsTableViewController
                mainVC.loggedUser = self.loggedUser
                navigationController?.pushViewController(mainVC, animated: true)
            default:
                print("default")
            }
        }
        else if tableView.indexPathForSelectedRow?.section == 1
        {
            switch indexPath.row
            {
            case 0:
                print("Navigate to Location Page")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = sb.instantiateViewController(withIdentifier: "locationVC") as! LocationViewController
                navigationController?.pushViewController(mainVC, animated: true)
            case 1:
                print("Navigate to Profile Page")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = sb.instantiateViewController(withIdentifier: "profileVC") as! ProfileViewController
                mainVC.loggedUser = self.loggedUser
                navigationController?.pushViewController(mainVC, animated: true)
            case 2:
                print("Navigate to Support Page")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = sb.instantiateViewController(withIdentifier: "supportVC") as! SupportViewController
                navigationController?.pushViewController(mainVC, animated: true)
            case 3:
                self.logout()
            default:
                print("default")
            }
        }
    }

    func hideBack()
    {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Easy Parking - \(self.loggedUser.name!)"
        //let buttonLogout = UIBarButtonItem(title: NSLocalizedString("STR_LOGOUT", comment: ""), style: UIBarButtonItem.Style.plain, target: self, action: #selector(MainTableViewController.logout))
        
        //self.navigationItem.rightBarButtonItem = buttonLogout
    }
    
    @objc func logout()
    {
        print("Navigate to Front Page")
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = sb.instantiateViewController(withIdentifier: "firstPageApp") as! ViewController
        //navigationController?.popToViewController(mainVC, animated: true)
        self.present(mainVC, animated: true, completion: nil)
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
