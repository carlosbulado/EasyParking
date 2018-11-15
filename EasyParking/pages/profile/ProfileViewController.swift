//
//  ProfileViewController.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-06.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var loggedUser : User = User()
    
    @IBOutlet weak var _name: UITextField!
    @IBOutlet weak var _login: UITextField!
    @IBOutlet weak var _pass: UITextField!
    @IBOutlet weak var _cont: UITextField!
    @IBOutlet weak var _plate: UITextField!
    @IBOutlet weak var _email: UITextField!
    @IBOutlet weak var _carCompany: UITextField!
    @IBOutlet weak var _carColor: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if loggedUser.id > 0
        {
            self._name.text = self.loggedUser.name
            self._login.text = self.loggedUser.login
            self._pass.text = self.loggedUser.password
            self._cont.text = self.loggedUser.contactNumber
            self._plate.text = self.loggedUser.plateNumber
            self._email.text = self.loggedUser.email
            self._carCompany.text = self.loggedUser.carCompany
            self._carColor.text = self.loggedUser.carColor
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveUser(_ sender: UIBarButtonItem) {
        do
        {
            let usServ = UserService()
            
            self.loggedUser.name = self._name.text
            self.loggedUser.login = self._login.text
            self.loggedUser.password = self._pass.text
            self.loggedUser.contactNumber = self._cont.text
            self.loggedUser.plateNumber = self._plate.text
            self.loggedUser.email = self._email.text
            self.loggedUser.carCompany = self._carCompany.text
            self.loggedUser.carColor = self._carColor.text
            
            let saved = try usServ.save(obj: self.loggedUser)
            
            if saved
            {
                SettingsUtil.saveSettings(user: self.loggedUser)
                AlertUtil.OkAlert(self, "Profile", "User successfully updated!"){ () -> () in
                    let sb = UIStoryboard(name: "Main", bundle: nil)
                    let mainVC = sb.instantiateViewController(withIdentifier: "mainMenuVC") as! MainMenuTableViewController
                    mainVC.loggedUser = self.loggedUser
                    self.navigationController?.pushViewController(mainVC, animated: true)
                }
            }
        }
        catch
        {
            
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
