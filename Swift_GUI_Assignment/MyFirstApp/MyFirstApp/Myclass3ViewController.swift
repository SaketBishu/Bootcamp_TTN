//
//  Myclass3ViewController.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 26/02/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class Myclass3ViewController: UIViewController {

    @IBOutlet weak var lastLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //let myViews = self.navigationController?.viewControllers[0]
        //lastLabel.text =
        for views in (self.navigationController?.viewControllers ?? []) {
            if views is CocaClassViewController{
                if let abcd = (views as! CocaClassViewController).label2.text{
                    lastLabel.text = abcd
                }
            }
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButtonPop(_ sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ButtonPopRoot(_ sender : UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func ButtonPopSpecific(_ sender : UIButton) {
        for views in (self.navigationController?.viewControllers ?? []) {
            if views is Mycocoa2{
                _ = self.navigationController?.popToViewController(views, animated:true)
            }
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
