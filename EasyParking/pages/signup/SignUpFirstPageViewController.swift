//
//  SignUpFirstPageViewController.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-10-30.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import UIKit

class SignUpFirstPageViewController: UIViewController {
    
    var user : User?
    @IBOutlet weak var nextBarButton: UIBarButtonItem!
    @IBOutlet weak var _name: UITextField!
    @IBOutlet weak var _login: UITextField!
    @IBOutlet weak var _password: UITextField!
    @IBOutlet weak var _contact: UITextField!
    @IBOutlet weak var _plate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextBarButton.isEnabled = false
        // Do any additional setup after loading the view.
        self.user = User()
    }
    
    @IBAction func onChangeName(_ sender: UITextField) {
        checkInputs()
        self.user?.name = self._name.text
    }
    
    @IBAction func onChangeLogin(_ sender: UITextField) {
        checkInputs()
        self.user?.login = self._login.text
    }
    
    @IBAction func onChangePassword(_ sender: UITextField) {
        checkInputs()
        self.user?.password = self._password.text
    }
    
    @IBAction func onChangeContact(_ sender: UITextField) {
        checkInputs()
        self.user?.contactNumber = self._contact.text
    }
    
    @IBAction func onChangePlate(_ sender: UITextField) {
        checkInputs()
        self.user?.plateNumber = self._plate.text
    }
    
    func checkInputs()
    {
        self.nextBarButton.isEnabled = false;
        if (((self._name?.text) != "") && ((self._login?.text) != "") && ((self._password?.text) != "") && ((self._contact?.text) != "") && ((self._plate?.text) != ""))
        {
            self.nextBarButton.isEnabled = true
        }
    }
    
    @IBAction func confirmCreateUser(_ sender: UIBarButtonItem) {
        
        let confirmCreateUserVc = navigationController?.storyboard?.instantiateViewController(withIdentifier: "confirmCreateUserVC") as! SignUpSecondPageViewController
        confirmCreateUserVc.user = self.user
        navigationController?.pushViewController(confirmCreateUserVc, animated: true)
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
