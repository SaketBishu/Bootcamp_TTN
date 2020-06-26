//
//  LoginViewController.swift
//  SocialLoginManager
//
//  Created by Saket Kumar on 24/06/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    @IBOutlet weak var email:UITextField!
    @IBOutlet weak var password:UITextField!
    @IBOutlet weak var loginButton:UIButton!
    @IBOutlet weak var signupButton:UIButton!
    @IBOutlet weak var googleSignInButton:GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        email.delegate = self
        password.delegate = self
        
        GIDSignIn.sharedInstance()?.presentingViewController = self

        
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton){
        
        let usremail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let usrpassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let logobj =  LoginManager.init(CustomLoginHandler(), type:.customLogin,email: usremail,password: usrpassword, username: nil, cnfPassword: nil)
        logobj.login()
    }
    
    @IBAction func signUpTapped(_ sender:UIButton){
        
        let vc = storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    

   
}

extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        email.resignFirstResponder()
        password.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
}
