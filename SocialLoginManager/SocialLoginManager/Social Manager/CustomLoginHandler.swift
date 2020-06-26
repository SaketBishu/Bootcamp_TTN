//
//  CustomLoginHandler.swift
//  SocialLoginManager
//
//  Created by Saket Kumar on 25/06/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class CustomLoginHandler:SocialAuthorize{
    
    func Customlogin(_ userEmail: String, _ userPasswd: String) {
        Auth.auth().signIn(withEmail: userEmail, password: userPasswd) { (result, error) in
                    if error != nil{
                        self.showMsg(error!.localizedDescription)
                    }
                    else{
                        
                            
                        self.showMsg("Successfully Logged In")
                        
                    }
                }
    }
    
    func signup(_ userName: String, _ userEmail: String, _ userPassword: String, _ userCnfPassword: String) {
        if userPassword == userCnfPassword{
        Auth.auth().createUser(withEmail:userEmail, password:userPassword) { (result, err) in
            
            if  err != nil{
                self.showMsg("Error creating user")
            }
            else{
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["username":userName, "uid": result!.user.uid]) { (error) in
                    
                    if error != nil{
                        self.showMsg("Userdata couldnt be saved")
                    }
                }
                self.showMsg("Signed In Successfully")
                
                //self.signIntoApp()
            }
        }
      }
        else{
            self.showMsg("wrong password")
        }
    }
    
    
    func showMsg(_ messages:String) -> UIAlertController {
        let uialert = UIAlertController(title: "Welcome", message:messages, preferredStyle: UIAlertController.Style.alert)
            uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            //self.present(uialert, animated: true, completion: nil)
        
       return uialert
        
    }
}
