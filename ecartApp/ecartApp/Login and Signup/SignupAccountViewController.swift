//
//  SignupAccountViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 30/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignupAccountViewController: UIViewController {

   
    @IBOutlet weak var cnfrmPasswdField: UITextField!
    @IBOutlet weak var PasswdField: UITextField!
    @IBOutlet weak var dateOfBirthField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        userName.delegate = self
        emailField.delegate = self
        dateOfBirthField.delegate = self
        PasswdField.delegate = self
        cnfrmPasswdField.delegate = self
    }
    
    func validateFields() -> String? {
        
        //Check that all fields are filled in
        
        if userName.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" || emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" || dateOfBirthField.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" || PasswdField.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" || cnfrmPasswdField.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" {
            
            return "please fill all the Fields"
        }
        
        let myPasswd = PasswdField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if isPasswordValid(myPasswd) == false{
            
            return "Password should contain 8 characters atleast,one special char,one number"
        }
        
        if PasswdField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != cnfrmPasswdField.text?.trimmingCharacters(in: .whitespacesAndNewlines){
            
            return "password doesnot match"
        }
        
        let myEmail = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if isEmailValid(myEmail) == false {
            
            return "Please enter the Correct Email format"
        }
        
        
        
        return nil
    }
    
    func isPasswordValid(_ password:String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@","^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    func isEmailValid(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    

    @IBAction func signupTapped(_ sender: Any) {
        
        //validate the fields
        let error = validateFields()
        
        if error != nil{
            showErrorMsg(error!)
        }
        else{
            
            let username = userName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswdField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let dob = dateOfBirthField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Create the User
            
            Auth.auth().createUser(withEmail:email, password:password) { (result, err) in
                
                if  err != nil{
                    self.showErrorMsg("Error creating user")
                }
                else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["username":username, "dob":dob, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil{
                            self.showErrorMsg("Userdata couldnt be saved")
                        }
                    }
                    //self.showErrorMsg("Signed In Successfully")
                    
                    self.signIntoApp()
                }
            }
            
            
        }
        
        
        
        
        //Transition to the HomeScreen
    }
    
    func showErrorMsg(_ messages:String){
        let uialert = UIAlertController(title: "Error", message:messages, preferredStyle: UIAlertController.Style.alert)
           uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(uialert, animated: true, completion: nil)
        
    }
    
    func signIntoApp(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        //DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        //}
       self.tabBarController?.selectedIndex = 0
       self.showErrorMsg("Successfully Logged In")
       
    }
    

}

extension SignupAccountViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userName.resignFirstResponder()
        emailField.resignFirstResponder()
        dateOfBirthField.resignFirstResponder()
        PasswdField.resignFirstResponder()
        cnfrmPasswdField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }

}
