//
//  SignUpViewController.swift
//  SocialLoginManager
//
//  Created by Saket Kumar on 24/06/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var username:UITextField!
    @IBOutlet weak var email:UITextField!
    @IBOutlet weak var password:UITextField!
    @IBOutlet weak var cnfPassword:UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpTapped(_ sender:UIButton){
        let name = username.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let usremail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let usrpassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let repassword = cnfPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let signobj = LoginManager.init(CustomLoginHandler(), type: .customSignup, email: usremail, password: usrpassword, username: name, cnfPassword: repassword)
        signobj.login()
        
    }
    
    @IBAction func backTapped(_ sender:UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
