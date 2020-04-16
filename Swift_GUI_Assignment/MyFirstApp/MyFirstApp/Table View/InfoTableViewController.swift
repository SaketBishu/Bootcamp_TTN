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
    private var button : UIButton!
    
    let datasource = ["saket","jay","Siddhant","vipul","Devansh","Rahul","Ranjan","Pratyush","Mohit","Shubham","Prerna","Kanika","Naushi","Irshad","Pankaj","Keshav","Rajat","Sarthak","Anmol","Shishir","Pragati","Vartika","Shrayansh","Yasharth","Mohitpareek","Garima","Diksha"]
    
    var empdata:[String] = []
    var limit = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        button = UIButton(frame: CGRect(x: 0, y: 0, width: table.bounds.width, height: 45))
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Load more", for: .normal)
        
        let nib = UINib.init(nibName: "InfoTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "customCell")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appendData()
    }
    
    func appendData(){
        for _ in 0...9{
            if limit < datasource.count{
            empdata.append(datasource[limit])
            limit = limit + 1
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return empdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "customCell") as! InfoTableViewCell
        
        cell.configure(text: empdata[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let customView = UIView(frame: CGRect(x:0,y:0,width:200,height:50))
//        customView.backgroundColor = UIColor.yellow
//
//        let button = UIButton(frame: CGRect(x:2,y:2,width:100,height:30))
//        button.backgroundColor = UIColor.white
//        button.titleLabel?.text = "Click"
//        button.titleLabel?.textColor = UIColor.black
//        customView.addSubview(button)
//
//        return customView
//
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let customView = UIView(frame: CGRect(x:0,y:0,width:200,height:50))
//        customView.backgroundColor = UIColor.yellow
//
//        let button = UIButton(frame: CGRect(x:2,y:2,width:100,height:30))
//        button.backgroundColor = UIColor.white
//        button.titleLabel?.text = "Click"
//        button.titleLabel?.textColor = UIColor.black
//        customView.addSubview(button)
//
//        return customView
//
//    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let lastSectionIndex = table.numberOfSections - 1
        let lastRowIndex = table.numberOfRows(inSection: lastSectionIndex) - 1
        
        if indexPath.section == lastSectionIndex && indexPath.row == lastRowIndex && empdata.count < datasource.count {
            self.table.tableFooterView = button
            self.table.tableFooterView?.isHidden = false
            
            button.addTarget(self, action: #selector(loadByDemand), for:.touchUpInside)
        }
        else{
            if empdata.count == datasource.count{
                self.table.tableFooterView?.isHidden = true
            }
        }
    }
    
    @objc func loadByDemand(){
        appendData()
        self.table.reloadData()
    }
    

   

}
