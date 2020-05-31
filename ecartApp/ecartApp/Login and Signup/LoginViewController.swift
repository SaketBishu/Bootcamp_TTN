//
//  LoginViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 25/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginView:UIView!
    @IBOutlet weak var signUpView:UIView!
    @IBOutlet weak var segmentOption:UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
   @IBAction func changedOption(_ sender:UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            loginView.alpha = 1
            signUpView.alpha = 0
        }
        else{
            loginView.alpha = 0
            signUpView.alpha = 1
        }
    }
    

    

}
