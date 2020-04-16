//
//  NextStackViewController.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 02/04/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class NextStackViewController: UIViewController {

    @IBOutlet weak var numText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        let num = Int(numText.text!)
        
        switch num {
        case 1:
            let vc = (storyboard?.instantiateViewController(withIdentifier: "FirstStackViewController")) as! FirstStackViewController
            navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
            let vc = storyboard?.instantiateViewController(withIdentifier: "SecondStackViewController") as! SecondStackViewController
            navigationController?.pushViewController(vc, animated: true)
            break
        case 3:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ThirdStackViewController") as! ThirdStackViewController
            navigationController?.pushViewController(vc, animated: true)
            break
        case 4:
            let vc = storyboard?.instantiateViewController(withIdentifier: "FourthStackViewController") as! FourthStackViewController
            navigationController?.pushViewController(vc, animated: true)
            break
        default:
            print("Invalid input")
        }
    }
    
   

}
