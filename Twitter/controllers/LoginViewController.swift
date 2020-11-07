//
//  LoginViewController.swift
//  Twitter
//
//  Created by Arpit Inder Singh on 06/11/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") {
            self.performSegue(withIdentifier: "login", sender: self)
        }
    }
    
    @IBAction func login(_ sender: Any) {
        let URL = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: URL, success: {
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "login", sender: self)
        }, failure: { (Error) in
            print("Could not log in.")
        })
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
