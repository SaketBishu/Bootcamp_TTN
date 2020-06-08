//
//  ViewController.swift
//  SelfSizingCellPractise
//
//  Created by Saket Kumar on 09/06/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dynamicTableView:UITableView!
    
    let datasource = ["hey","How are u doing. I hope every thing is fine and u are doing great","so lets meet","lets have some coffee and hangout in evening for some time, hope u are free."]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dynamicTableView.delegate = self
        dynamicTableView.dataSource = self
        let nib = UINib(nibName: "SelfSizingTableViewCell", bundle: nil)
        dynamicTableView.register(nib, forCellReuseIdentifier: "dynamicCell")
        dynamicTableView.estimatedRowHeight = 80
        dynamicTableView.rowHeight = UITableView.automaticDimension
        
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dynamicTableView.dequeueReusableCell(withIdentifier: "dynamicCell", for: indexPath) as! SelfSizingTableViewCell
        
        cell.labelText.text = datasource[indexPath.row]
        return cell
    }
    
    
}

