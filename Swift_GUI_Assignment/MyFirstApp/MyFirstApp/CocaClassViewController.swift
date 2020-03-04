//
//  CocaClassViewController.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 26/02/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class CocaClassViewController: UIViewController{
    
    @IBOutlet weak var abc: UILabel!
    
    @IBOutlet weak var firstSegment: UISegmentedControl!
    
    
    @IBOutlet weak var label2: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Trainee"
        label2.text = "hello Saket"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "NextView", style: .plain, target: self, action: #selector(self.buttonTapped(_:)))
      
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure("saket")
    }
    
    
    
    func configure(_ abcd:String)
    {
        abc.text = abcd
    }
    
    @IBAction func buttonTapped(_ sender : UIButton)
    {
        pushToviewControl()
        return
        sender.tag += 1
        configure("button tag\(sender.tag)")
        
    }
  
    func pushToviewControl()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Mycocoa2")
        //self.navigationController?.present(vc, animated: true, completion: nil)
        self.navigationController!.pushViewController(vc, animated: true)
        //var MyviewControllers = self.navigationController?.viewControllers
    }
    @IBAction func OnOf(_ sender : UISwitch)
    {
        if sender.isOn
            
        {
            abc.text = "Is ON"
        print("Is On")
        }
        else{
            abc.text = "Is OFF"
            print("Is of")
        }
    }
    
    
    @IBAction func SelectedSegment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            abc.text = "first index"
        case 1:
        abc.text = "second index"
        case 2:
        abc.text = "third index"
            
        default:
            break
        }
    }
    
    @IBAction func buttonClicked(_ sender: UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        //self.navigationController?.present(vc, animated: true, completion: nil)
        self.navigationController!.pushViewController(vc, animated: true)
        
    }
    
    
   

}
