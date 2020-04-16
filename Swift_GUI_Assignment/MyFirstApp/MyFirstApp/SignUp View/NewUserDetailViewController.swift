//
//  NewUserDetailViewController.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 03/03/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class NewUserDetailViewController: UIViewController {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        profileImageView.contentMode = .scaleAspectFill
        
        for views in (self.navigationController?.viewControllers ?? []) {
            if views is SignUpViewController{
                if let someImage = (views as! SignUpViewController).myImageView.image{
                    profileImageView.image = someImage
                }
            }
        }

        // Do any additional setup after loading the view.
    }
    
    func pushToviewControl()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EmployeeSegmentViewController")
        //self.navigationController?.present(vc, animated: true, completion: nil)
        self.navigationController!.pushViewController(vc, animated: true)
        //var MyviewControllers = self.navigationController?.viewControllers
    }
    
    @IBAction func nextButtonClicked(_ sender:UIButton){
        pushToviewControl()
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
