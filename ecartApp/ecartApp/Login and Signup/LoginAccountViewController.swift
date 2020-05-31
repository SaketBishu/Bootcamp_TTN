//
//  LoginAccountViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 30/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class LoginAccountViewController: UIViewController {
    
    @IBOutlet weak var googleSignInButton:GIDSignInButton!
    
    @IBOutlet weak var loginPasswdField: UITextField!
    @IBOutlet weak var nameOrEmailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        loginPasswdField.delegate = self
        nameOrEmailField.delegate = self
        
        googleSignInButton.layer.cornerRadius = 25
        googleSignInButton.layer.masksToBounds = true
        googleSignInButton.colorScheme = .dark
        googleSignInButton.style = .wide
        
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    

    @IBAction func loginTapped(_ sender: Any) {
        
        let email = nameOrEmailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = loginPasswdField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        //Signing in user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil{
                self.showErrorMsg(error!.localizedDescription)
            }
            else{
                //self.showErrorMsg("Successfully Logged In")
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//                //self.navigationController?.pushViewController(vc, animated: true)
                //DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                //}
                self.tabBarController?.selectedIndex = 0
                self.showErrorMsg("Successfully Logged In")
                
            }
        }
    }
    
    @IBAction func forgotPasswordTapped(_ sender:Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
        navigationController?.pushViewController(vc, animated: true)
    
    }
    
    
    
    func showErrorMsg(_ messages:String){
        let uialert = UIAlertController(title: "Welcome", message:messages, preferredStyle: UIAlertController.Style.alert)
            uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(uialert, animated: true, completion: nil)
       
        
    }
    
    
    

}
extension LoginAccountViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameOrEmailField.resignFirstResponder()
        loginPasswdField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
}
extension LoginAccountViewController:GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let err = error{
            print("Login Failure",err)
            return
        }
        print("Successfully logged in Google Account")
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            
            if let err = error{
                print("Failed to create Firebase User with Google Account",err)
            }
            
            guard let uid = user.userID else{return}
            print("Successfully logged into Firebase with Google",uid)
            self.navigationController?.popViewController(animated: true)
            self.tabBarController?.selectedIndex = 0
            self.showErrorMsg("Successfully Logged In")
            
            
        }
    }
    
    
    
    
}

