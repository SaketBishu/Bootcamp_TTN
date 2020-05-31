//
//  EmployeeDetailsViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 25/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class EmployeeDetailsViewController: UIViewController {
    @IBOutlet weak var listView:UIView!
    @IBOutlet weak var cardView:UIView!
    @IBOutlet weak var employeeSegment:UISegmentedControl!
    //let employeeData:EmployeeData? = nil
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        listView.alpha = 1
        cardView.alpha = 0
        }
    
    
    @IBAction func employeeDisplayOption(_ sender:UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            listView.alpha = 1
            cardView.alpha = 0
        }
        else{
            listView.alpha = 0
            cardView.alpha = 1
        }
    }
    
}
