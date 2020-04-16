//
//  NestedCollectionViewController.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 21/03/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class NestedCollectionViewController: UIViewController {
    @IBOutlet weak var tableView : UITableView!
    
    
    let datasource = ["Science Fiction","Kids","Horrors","Drama","Action"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension NestedCollectionViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"NestedCollectionTableViewCell", for: indexPath) as! NestedCollectionTableViewCell
        cell.label.text = datasource[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
