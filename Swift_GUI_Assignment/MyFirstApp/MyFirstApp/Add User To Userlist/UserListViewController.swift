//
//  UserListViewController.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 23/03/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
   
    
    @IBOutlet weak var tableview:UITableView!
    private var button : UIButton!
    
    public static var datasource = [UserDetail]()
    public static var tempdatasource = [UserDetail]()
    var limit = 0
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "user list"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New User", style: .plain, target: self, action: #selector(self.buttonTapped(_:)))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(self.buttonrefreshTapped(_:)))

        button = UIButton(frame: CGRect(x: 0, y: 0, width: tableview.bounds.width, height: 45))
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Load more", for: .normal)

        
        let nib = UINib.init(nibName: "UserDataTableViewCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableview.reloadData()
    }
    @objc func buttonTapped(_ sender : UIButton){
        pushToviewControl()
    }
    
    @objc func buttonrefreshTapped(_ sender : UIButton){
        if UserListViewController.datasource.count <= 5{
            self.tableview.reloadData()
        }
        else{
            UserListViewController.tempdatasource = UserListViewController.datasource
            UserListViewController.datasource = []
            limit = 0
            appendData()
            tableview.reloadData()
            if UserListViewController.datasource.count < UserListViewController.tempdatasource.count{
                self.tableview.tableFooterView = button
                self.tableview.tableFooterView?.isHidden = false

                button.addTarget(self, action: #selector(loadByDemand), for:.touchUpInside)
            }
            else{
                if UserListViewController.datasource.count == UserListViewController.tempdatasource.count{
                    self.tableview.tableFooterView?.isHidden = true
                }
            }

            }

    }

    @objc func loadByDemand(){
        if UserListViewController.datasource.count == UserListViewController.tempdatasource.count{
            self.tableview.tableFooterView?.isHidden = true
             
        }
        else{
        appendData()
        self.tableview.reloadData()
        }
    }

    func appendData(){
        for _ in 0...4{
            if limit < UserListViewController.tempdatasource.count{
                UserListViewController.datasource.append(UserListViewController.tempdatasource[limit])
                limit = limit + 1
            }
        }
    }

    func pushToviewControl()
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "AddUserViewController")
        //self.navigationController?.present(vc, animated: true, completion: nil)
        self.navigationController!.pushViewController(vc, animated: true)
        //self.tableview.reloadData()

    }
    
    
    

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return UserListViewController.datasource.count

   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! UserDataTableViewCell
    let useDet = UserListViewController.datasource[indexPath.row]
    
    if let detailCell = cell as? UserDataTableViewCell{

    //cell.cellValue(UserListViewController.datasource[indexPath.row])
        detailCell.cellValue(userDetail:useDet)
//        detailCell.namelabel?.text = useDet.name
//        detailCell.addresslabel?.text = useDet.address
//        detailCell.agelabel?.text = useDet.age
//        detailCell.detaillabel?.text = useDet.detail
//        detailCell.imageView?.contentMode = .scaleAspectFill
//        detailCell.imageView?.image = useDet.image
    }
    return cell
    
   }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
   

}
