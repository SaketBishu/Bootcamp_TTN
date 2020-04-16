//
//  Mycocoa2.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 26/02/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class Mycocoa2: UIViewController {
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trainee1"

        // Do any additional setup after loading the view.
    }
    
   /* @IBAction func dismissView()
    {
        //dismiss(animated: true, completion: nil)
    }
 */
    @IBAction func buttonTapped(_ sender : UIButton)
    {
        pushToviewControl()
        return
        
        
    }
    func pushToviewControl()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Myclass1ViewController")
        //self.navigationController?.present(vc, animated: true, completion: nil)
        self.navigationController!.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func ButtonPop(_ sender : UIButton)
    {
        self.navigationController?.popViewController(animated: true)
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
