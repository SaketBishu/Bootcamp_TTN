//
//  EmployeeSegmentViewController.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 04/03/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class EmployeeSegmentViewController: UIViewController {
    
    
    @IBOutlet weak var segmentLabel: UILabel!
    
    @IBOutlet weak var employeeSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func selectedSegment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            segmentLabel.text = "Employer Segment"
        case 1:
            segmentLabel.text = "Employee Segment"
        default: break
        }
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
