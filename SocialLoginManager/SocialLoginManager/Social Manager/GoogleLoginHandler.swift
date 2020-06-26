//
//  GoogleLoginHandler.swift
//  SocialLoginManager
//
//  Created by Saket Kumar on 25/06/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
class GoogleLoginHandler:SocialAuthorize{
    
    
    func SocialLogin() {
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
                //self.showErrorMsg("Successfully Logged In")
                
                
            }
        }
    }
    
}
