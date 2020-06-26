//
//  LoginManager.swift
//  SocialLoginManager
//
//  Created by Saket Kumar on 24/06/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import Foundation

enum loginType{
    case customLogin
    case customSignup
    case googleLogin
}

enum errorType{
    case invalidEmailOrPassword
    case logInFailure
    case UserNotFound
}



protocol SocialAuthorize{
    func Customlogin(_ userEmail:String,_ userPasswd:String)
    func SocialLogin()
    func signup(_ userName:String,_ userEmail:String,_ userPassword:String,userCnfPassword:String)
}
extension SocialAuthorize{
    func signup(_ userName:String,_ userEmail:String,_ userPassword:String,userCnfPassword:String){}
    func Customlogin(_ userEmail:String,_ userPasswd:String){}
    func SocialLogin(){}
}



class LoginManager{
    
    let socialAuthorizeable:SocialAuthorize
    let socialType:loginType
    let email:String
    let password:String
    let username:String
    let cnfPassword:String
    
    init(_ socialAuth:SocialAuthorize,type:loginType,email:String?,password:String?,username:String?,cnfPassword:String?) {
        socialAuthorizeable = socialAuth
        socialType = type
        self.email = email!
        self.password = password!
        self.username = username!
        self.cnfPassword = cnfPassword!
    }
    
    func login(){
        if self.socialType == .customLogin{
            self.socialAuthorizeable.Customlogin(self.email, self.password)
        }
        else if self.socialType == .customSignup{
            self.socialAuthorizeable.signup(self.username, self.email, self.password,userCnfPassword: self.cnfPassword)
        }
    }
    
    
}
