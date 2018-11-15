//
//  SignUpSecondPageViewController.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-10-31.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import UIKit

class SignUpSecondPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var user : User?
    var userInfo : [TableTitleLabelModel] = []
    @IBOutlet weak var confirmReportArea: UITextView!
    @IBOutlet weak var tableRegUser: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableRegUser.delegate = self
        tableRegUser.dataSource = self
        
        if let us = self.user
        {
            let name = us.name
            let login = us.login
            let pass = us.password
            let cont = us.contactNumber
            let plate = us.plateNumber
            
            userInfo.append(TableTitleLabelModel("Username:", name))
            userInfo.append(TableTitleLabelModel("Login:", login))
            userInfo.append(TableTitleLabelModel("Password:", pass))
            userInfo.append(TableTitleLabelModel("Contact Number:", cont))
            userInfo.append(TableTitleLabelModel("Plate Number:", plate))
        }
        else
        {
            AlertUtil.OkAlert(self, "Error", "Error while creating user")
        }
    }
    
    @IBAction func saveNewUser(_ sender: UIBarButtonItem) {
        let userService = UserService()
        do
        {
            let saved = try userService.save(obj: self.user!)
            if (saved)
            {
                AlertUtil.OkAlert(self, "Sign Up", "User successfully created!")
                { () -> () in
                    self.dismiss(animated: true, completion: nil)
                }
            }
            else
            {
                let alert = UIAlertController(title: "Error", message: "Error while creating user", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }
        }
        catch
        {
            let alert = UIAlertController(title: "Error", message: "Unknown Error!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    func numberOfSections(in tableView : UITableView) -> Int
    {
        return 1;
    }
    
    func tableView(_ tableView : UITableView, numberOfRowsInSection section : Int) -> Int
    {
        return self.userInfo.count;
    }
    
    func tableView(_ tableView : UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell
    {
        return TableTitleLabelModel.CreateCell(tableView, cellForRowAt: indexPath, cellIdentifier: "cellRegUser", arrayInfo: self.userInfo)
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
