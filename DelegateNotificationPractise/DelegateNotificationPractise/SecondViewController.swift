//
//  SecondViewController.swift
//  DelegateNotificationPractise
//
//  Created by Saket Kumar on 09/06/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

protocol ReceiverDelegate {
        func didReceive(message: String)
}

class SecondViewController: UIViewController {
    
    
    var delegate: ReceiverDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func finish(_ sender: Any) {
     NotificationCenter.default.post(Notification(name: Notification.Name("notification")))

     delegate?.didReceive(message: "I am Delegate View Controller")
        self.dismiss(animated: true, completion: nil)
    }

    

}
