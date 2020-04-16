//
//  TabTwoViewController.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 09/03/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class TabTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second Tab"
        view.backgroundColor = .systemPink

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonNavigate(_ sender:UIButton) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "NavigateViewController") else {return}
        navigationController?.pushViewController(vc, animated: true)
        
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
