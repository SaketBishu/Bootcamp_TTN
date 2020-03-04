//
//  InfoTableViewController.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 04/03/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class InfoTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    let datasource = ["saket","jay","Siddhant","vipul","Devansh"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "InfoTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "customCell")
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "customCell") as! InfoTableViewCell
        cell.configure(text: datasource[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let customView = UIView(frame: CGRect(x:0,y:0,width:200,height:50))
        customView.backgroundColor = UIColor.yellow
        
        let button = UIButton(frame: CGRect(x:2,y:2,width:100,height:30))
        button.backgroundColor = UIColor.white
        button.titleLabel?.text = "Click"
        button.titleLabel?.textColor = UIColor.black
        customView.addSubview(button)
        
        return customView
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customView = UIView(frame: CGRect(x:0,y:0,width:200,height:50))
        customView.backgroundColor = UIColor.yellow
        
        let button = UIButton(frame: CGRect(x:2,y:2,width:100,height:30))
        button.backgroundColor = UIColor.white
        button.titleLabel?.text = "Click"
        button.titleLabel?.textColor = UIColor.black
        customView.addSubview(button)
        
        return customView
        
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
