//
//  ResetPasswordViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 31/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit
import FirebaseAuth

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailResetTextField:UITextField!
    @IBOutlet weak var emailResetLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        emailResetLabel.alpha = 0
        emailResetTextField.delegate = self
        
        
    }
    
    @IBAction func resetPasswordTapped(_ sender:Any){
        let email = emailResetTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if email != nil{
            resetPassword(email: email!, onSuccess: {self.emailResetLabel.text = "Password Set Successfully"}, onError: {errorMsg in  self.emailResetLabel.text = errorMsg})
        }else{
            //emailResetLabel.alpha = 1
            emailResetLabel.text = "Please enter the Email"
            emailResetLabel.alpha = 1
        }
    }
    
    func resetPassword(email:String,onSuccess:@escaping() -> Void,onError:@escaping (_ errorMsg:String) -> Void ){
        emailResetLabel.alpha = 1
        emailResetLabel.text = "Password Reset Email has been sent to your Email ID"
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error == nil{
                onSuccess()
            }else{
                onError(error!.localizedDescription)
            }
        }
    }
    

    

}

extension ResetPasswordViewController:UITextFieldDelegate{
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailResetTextField.resignFirstResponder()
        return true
    }
    
    
}
