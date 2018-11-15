//
//  LoginViewController.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-05.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.loginButton.isEnabled = false;
    }
    
    @IBAction func onLoginChange(_ sender: UITextField) {
        self.onInputsChange()
    }
    
    @IBAction func onPasswordChange(_ sender: Any) {
        self.onInputsChange()
    }
    
    func onInputsChange()
    {
        self.loginButton.isEnabled = false;
        if(self.login.text != "" && self.password.text != "")
        {
            self.loginButton.isEnabled = true;
        }
    }
    
    @IBAction func loginClick(_ sender: UIButton) {
        do
        {
            let userServ = UserService()
            let user = try userServ.Login(self.login.text, self.password.text)
            if(user.id > 0)
            {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = sb.instantiateViewController(withIdentifier: "mainMenuVC") as! MainMenuTableViewController
                mainVC.loggedUser = user
                navigationController?.pushViewController(mainVC, animated: true)
            }
            else
            {
                AlertUtil.OkAlert(self, "Error", "Login/Password Incorrect")
            }
        }
        catch
        {
            AlertUtil.OkAlert(self, "Error", "Server Error")
        }
    }
    
    @IBAction func forgotUserPassClick(_ sender: UIButton) {
        
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
