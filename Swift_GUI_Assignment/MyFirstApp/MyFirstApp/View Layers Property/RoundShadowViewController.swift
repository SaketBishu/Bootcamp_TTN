//
//  RoundShadowViewController.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 11/03/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class RoundShadowViewController: UIViewController {

    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myUIView:UIView!
    @IBOutlet weak var newUIView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      //shadow on UIView containing a subview(Imageview)
        myUIView.backgroundColor = UIColor.clear
        myUIView.layer.borderColor = UIColor.black.cgColor
        myUIView.layer.borderWidth = 1.0
        myUIView.layer.shadowColor = UIColor.black.cgColor
        myUIView.layer.shadowRadius = 10
        myUIView.layer.shadowOffset = CGSize(width: 20, height: 15)
        myUIView.layer.shadowOpacity = 0.7
        myUIView.layer.cornerRadius = 25
        
        
        myImageView.frame = myUIView.bounds
        myImageView.layer.cornerRadius = 25
        myUIView.addSubview(myImageView)
        
        
        // shadow on uiview
        newUIView.layer.cornerRadius = 20
        
        newUIView.layer.borderWidth = 1.0
        newUIView.layer.borderColor = UIColor.black.cgColor
        
        newUIView.layer.shadowColor = UIColor.black.cgColor
        newUIView.layer.shadowOffset = CGSize(width: 15, height: 10)
        newUIView.layer.shadowOpacity = 0.7
        newUIView.layer.shadowRadius = 10
        
        
        //myImageView.layer.shadowPath = UIBezierPath(rect: myImageView.bounds).cgPath
        //myImageView.clipsToBounds = true
        // Do any additional setup after loading the view.
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
