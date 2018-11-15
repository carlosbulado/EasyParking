//
//  HelpViewController.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-12.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import UIKit
import WebKit

class HelpViewController: UIViewController {

    @IBOutlet weak var webHelp: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load content from URL
        let url = URL(string: "https://lmgtfy.com/?q=need+some+help%3F+I+DO+NOT+CARE!")
        if let u = url
        {
            let request = URLRequest(url: u)
            webHelp.load(request)
        }
        
        // Load content from string
        //webHelp.loadHTMLString("<h1>Hello World</h1>", baseURL: nil)
        
        // Load content from file
        //let locationFile = Bundle.main.url(forResource: "help", withExtension: "html")
        //let myRequest = URLRequest(url: locationFile)
        //self.webHelp.load(myRequest)
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
