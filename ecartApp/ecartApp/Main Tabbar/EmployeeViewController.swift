//
//  EmployeeViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 30/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class EmployeeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func detailButton(_ sender:UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EmployeeDetailsViewController") as! EmployeeDetailsViewController
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    

   

}
