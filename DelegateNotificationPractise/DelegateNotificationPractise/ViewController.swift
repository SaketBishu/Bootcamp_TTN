//
//  ViewController.swift
//  DelegateNotificationPractise
//
//  Created by Saket Kumar on 09/06/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit




class ViewController: UIViewController,ReceiverDelegate {
    
    @IBOutlet weak var messageLabel:UILabel!
    @IBOutlet weak var notifyLabel:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default
        .addObserver(self, selector: #selector(willfinish),
                     name: Notification.Name("notification"), object: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let desVC = segue.destination as! SecondViewController
        desVC.delegate = self
    }
    
    
    func didReceive(message: String) {
        messageLabel.text = message
    }
    
    @objc func willfinish() {
        notifyLabel.text = "Recieved first Notification"
    }


}

